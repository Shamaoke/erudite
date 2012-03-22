describe 'Erudite', ->
  describe 'Game', ->
    beforeEach ->
      sinon   = require('sinon')
      Erudite = require('../../lib/erudite')['Erudite']
      output  = { write: -> }
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
      it 'prompts for coordinates for the second tile.', ->
        @game.enter_coordinates()
        @output_spy.calledWith("Please, enter coordinates for the second tile.\n").should.be.true
