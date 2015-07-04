class Greeting
  constructor: (greeting) ->
    @greeting = greeting || 'Hello'

  hello: (name) ->
    console.log "AAAAAARRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRGH #{@greeting} #{name}!"
