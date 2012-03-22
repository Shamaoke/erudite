@Erudite =
  run: ->
    process.stdin.resume()
    process.stdin.setEncoding 'utf-8'
    game = new @Game(process.stdout)
    game.start()
    process.stdin.addListener 'data', game.enter_coordinates

class @Erudite.Game
  constructor: (output) ->
    @output = output
    @prompt =
      first:  "Please, enter coordinates for the first tile.\n"
      second: "Please, enter coordinates for the second tile.\n"
      form:   "Input must be of the form 'x,y'.\n"
      type:   "Each coordinate must be an integer.\n"
      range:  "Each coordinate must be between 1 and 5.\n"

  enter_coordinates: (input) =>
    @callback() if @validates input

  validates: (input) ->
    unless ([x, y] = input.split(',').map( (elm) -> parseInt elm, 10 )).length is 2
      @output.write @prompt.form
      return false
    else unless x is Math.round(x) and y is Math.round(y)
      @output.write @prompt.type
      return false
    else unless 0 < x < 6 and 0 < y < 6
      @output.write @prompt.range
      return false
    return true

  set_callback: (message, block) =>
    @callback = -> @output.write message; block()

  prompt_for_first_tile: =>
    @set_callback @prompt.first, @prompt_for_second_tile

  prompt_for_second_tile: =>
    @set_callback @prompt.second, @prompt_for_first_tile

  start: ->
    @output.write "Welcome to Erudite!\n"
    @prompt_for_first_tile()
    @callback()
