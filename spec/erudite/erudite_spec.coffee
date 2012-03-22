describe 'Erudite', ->
  describe 'Game', ->
    describe 'start', ->
      beforeEach ->
        sinon   = require('sinon')
        Erudite = require('../../lib/erudite')['Erudite']
        output  = { write: -> }
        @output_spy = sinon.spy output, 'write'
        @game = new Erudite.Game(output)

      it 'sends a welcome message', ->
        @game.start()
        @output_spy.calledWith("Welcome to Erudite!\n").should.be.true

      it 'promps for coordinates for the first tile', ->
        @game.start()
        @output_spy.calledWith("Please, enter coordinates for the first tile.\n").should.be.true
