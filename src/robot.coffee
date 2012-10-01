# robot.coffee
class @Robot
  up = 0; right = 90; down = 180; left = 270

  map = null
  brain = null

  constructor: (@x, @y, @orientation) ->

  getX: -> @x
  getY: -> @y
  getOrientation: -> @orientation

  setMap: (map) -> @map = map
  setBrain: (brain) -> @brain = brain

  checkSetup: ->
    if @orientation % 90 != 0 then throw new Error 'Orientation should be 0, 90, 180, 270'
    if !@brain then throw Error 'Robot should have a brain: use setBrain()'
    if !@map then throw Error 'Robot should have a map: use setMap()'

  tick: -> @brain.think() # TODO: Pass what sensors have detected

  turnLeft: -> @turn(-90, up, left)
  turnRight: -> @turn(90, left, up)
  turn: (degrees, limit, fallback) ->
    @orientation = if @orientation == limit then fallback else @orientation + degrees

  goForward: ->
    switch @orientation
      when up then @y--
      when down then @y++
      when left then @x--
      when right then @x++

# TODO: Visual sensor
# TODO: Collision sensor


# abstract-brain.coffee
class @AbstractBrain
  robot = null

  constructor: (@name) ->
  think: -> throw new Error 'AbstractBrain should be extended: implement think()'


# map.coffee
class @Map
  presentation = [
    [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    [0, 0, 0, 1, 1, 1, 1, 0, 0, 0]
    [1, 1, 0, 0, 0, 0, 1, 0, 1, 1]
    [1, 1, 1, 1, 1, 0, 1, 0, 0, 1]
    [1, 1, 1, 0, 0, 0, 1, 1, 0, 1]
    [1, 1, 1, 0, 1, 1, 1, 1, 0, 1]
    [1, 1, 1, 0, 0, 1, 0, 0, 0, 1]
    [1, 1, 1, 1, 0, 0, 0, 1, 1, 1]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  ] # Figure out a nicer way to present simple coordinates: maybe parse a string to an array like this?

  getPresentation: -> presentation

# environment.coffee
class @Simulation
  robot = null
  ratio = 50

  constructor: (@map, @brain) ->
    @robot = new Robot(3, 2, 180)
    @robot.setMap(@map)
    @robot.setBrain(@brain)

  tick: -> robot.tick()

  buildMap: ->
    for row, columns of @map.getPresentation()
      for column, value of columns
        type = switch value
          when 1 then 'wall'
          else 'empty'

        $('#arena').append("<div class='#{type}' style='top: #{row * ratio}px; left: #{column * ratio}px;'></div>")

    @refresh()

  refresh: ->
    $('#robot').attr 'style', "top: #{@robot.getY() * ratio}px; left: #{@robot.getX() * ratio}px;"




