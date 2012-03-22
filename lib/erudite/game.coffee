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

  enter_coordinates: (input) =>
    @callback() if @validates input

  validates: (input) ->
    unless input.split(',').length is 2
      @output.write "Input must be of the form 'x,y'.\n"
      return false
    return true

  prompt_for_first_tile: ->
    @callback = ->
      @output.write "Please, enter coordinates for the first tile.\n"
      @prompt_for_second_tile()

  prompt_for_second_tile: ->
    @callback = ->
      @output.write "Please, enter coordinates for the second tile.\n"
      @prompt_for_first_tile()

  start: ->
    @output.write "Welcome to Erudite!\n"
    @prompt_for_first_tile()
    @callback()
