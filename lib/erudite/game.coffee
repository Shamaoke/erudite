@Erudite = { }

class @Erudite.Game
  constructor: (output) ->
    @output = output

  enter_coordinates: ->
    @callback()

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
    @enter_coordinates()
