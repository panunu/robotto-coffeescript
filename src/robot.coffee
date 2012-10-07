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

  getNextPosition: (step = 1) ->
    [x, y] = [@x, @y]

    switch @orientation
      when up then y = y - step
      when down then y = y + step
      when left then x = x - step
      when right then x = x + step

    [x, y]

  goForward: ->
    [x, y] = @getNextPosition()

    try
      if @map.getPresentation()[y][x] == 1 then false
      else
        [@x, @y] = [x, y]
        true
    catch error then false

  # TODO: Separate visual sensor to a component
  see: ->
    [x, y] = @getNextPosition()

    try @map.getPresentation()[y][x]
    catch error then 1

  # TODO: Collision sensor

(exports ? this).Robot = Robot