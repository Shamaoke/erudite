module.exports = ->
  @World = require('../support/env')['World']

  @Before (callback) ->
    @Output =
      _messages: []
      messages: -> @_messages
      write: (message) -> @_messages.push message
    callback()

  @When /^I start a game$/, (callback) ->
    game = new @Erudite.Game(@Output)
    game.start()
    callback()

  @Then /^I should see "([^"]*)"$/, (message, callback) ->
    @Output.messages().should.include message.concat "\n"
    callback()
