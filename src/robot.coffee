class Robot
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
    if @orientation % 90 != 0 or @orientation < 0 then throw new Error 'Orientation should be 0, 90, 180, 270'
    if !@brain then throw Error 'Robot should have a brain: use setBrain()'
    if !@map then throw Error 'Robot should have a map: use setMap()'

  tick: -> @brain.think() # TODO: Pass what sensors have detected to the brain

  turnLeft: -> @turn(-90, up, left)
  turnRight: -> @turn(90, left, up)
  turn: (degrees, limit, fallback) ->
    @orientation = if @orientation == limit then fallback else @orientation + degrees

  goForward: ->
    original = {y: @y, x: @x}

    switch @orientation
      when up then @y--
      when down then @y++
      when left then @x--
      when right then @x++

    if @map.getPresentation()[@y][@x] == 1 # TODO: Remove magic
      @y = original.y
      @x = original.x
      false
    else true

  see: ->
    switch @orientation
      when down then @map.getPresentation()[@y - 1][@x]


# TODO: Visual sensor
# TODO: Collision sensor

(exports ? this).Robot = Robot