class @AbstractBrain
  robot = null

  constructor: (@name) ->
  think: -> throw new Error 'AbstractBrain should be extended: implement think()'
