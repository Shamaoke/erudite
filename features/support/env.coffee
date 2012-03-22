require 'should'

@World = (callback) ->
  { Erudite: @Erudite } = require '../../lib/erudite'
  callback @
