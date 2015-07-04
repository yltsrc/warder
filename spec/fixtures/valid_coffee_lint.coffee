class Greeting
  constructor: (greeting) ->
    @greeting = greeting || 'Hello'

  hello: (name) ->
    console.log "#{@greeting} #{name}!"
