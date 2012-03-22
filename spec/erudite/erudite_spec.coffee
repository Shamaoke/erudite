describe 'Erudite', ->
  describe 'Game', ->
    beforeEach ->
      sinon = require 'sinon'
      { Erudite } = require '../../lib/erudite'
      output = { write: -> }
      @output_spy = sinon.spy output, 'write'
      @game = new Erudite.Game(output)

    describe 'start', ->
      it 'sends a welcome message', ->
        @game.start()
        @output_spy.calledWith("Welcome to Erudite!\n").should.be.true

      it 'prompts for coordinates for the first tile', ->
        @game.start()
        @output_spy.calledWith("Please, enter coordinates for the first tile.\n").should.be.true

    describe 'enter_coordinates', ->
      beforeEach ->
        @game.start()

      describe 'data are correct', ->
        describe 'before entering coordinates for the first tile', ->
          it 'prompts for coordinates for the first tile.', ->
            @output_spy.calledWith("Please, enter coordinates for the first tile.\n").should.be.true

        describe 'before entering coordinates for the second tile', ->
          it 'prompts for coordinates for the second tile', ->
            @game.enter_coordinates('1,2')
            @output_spy.calledWith("Please, enter coordinates for the second tile.\n").should.be.true

      describe 'data are incorrect', ->
        describe 'data have an incorrect format', ->
          it 'informs about correct format', ->
            @game.enter_coordinates "1,2,3"
            @output_spy.calledWith("Input must be of the form 'x,y'.\n").should.be.true

        describe 'data are in incorrect range', ->
          it 'informs about correct range', ->
            callback = (coords) ->
              @game.enter_coordinates coords
              @output_spy.calledWith("Each coordinate must be between 1 and 5.\n").should.be.true

            ['0,1', '6,1', '1,0', '1,6'].forEach callback.bind(@)

        describe 'data are in incorrect type', ->
          it 'informs about correct type', ->
            callback = (coords) ->
              @game.enter_coordinates coords
              @output_spy.calledWith("Each coordinate must be an integer.\n").should.be.true

            ['a,1', '1,a'].forEach callback.bind(@)
