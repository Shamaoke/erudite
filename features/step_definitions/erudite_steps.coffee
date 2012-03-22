module.exports = ->
  { World: @World } = require '../support/env'

  @Before (callback) ->
    @Output =
      _messages: []
      messages: -> @_messages
      write: (message) -> @_messages.push message
    callback()

  @When /^I start(?:|ed) a game$/, (callback) ->
    @game = new @Erudite.Game(@Output)
    @game.start()
    callback()

  @When /^I enter(?:|ed) "([^"]*)"$/, (data, callback) ->
    @game.enter_coordinates data
    callback()

  @Then /^I should see "([^"]*)" (.*)$/, (message, count, callback) ->
    messages = @Output.messages().filter( (elm) -> elm is message.concat "\n" )
    if count is 'once'
      messages.length.should.eql 1
    else if count is 'twice'
      messages.length.should.eql 2
    callback()
