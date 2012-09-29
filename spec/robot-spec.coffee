require '../src/robot.coffee'

describe 'Robot', ->
  robot = null

  beforeEach ->
    robot = new Robot(0, 0, 0)

  it 'should have x and y', ->
    robot = new Robot(1, 2, 0)
    expect(robot.x).toBe 1
    expect(robot.y).toBe 2

  it 'should have orientation', ->
    expect(robot.orientation).toBe 0

  xit 'should throw if orientation is invalid', ->
    expect(new Robot(0, 0, -1)).toThrow()

  it 'should turn right', ->
    robot.turnRight(); expect(robot.orientation).toBe 90
    robot.turnRight(); expect(robot.orientation).toBe 180
    robot.turnRight(); expect(robot.orientation).toBe 270
    robot.turnRight(); expect(robot.orientation).toBe 0
    robot.turnRight(); expect(robot.orientation).toBe 90

  it 'should turn left', ->
    robot.turnLeft(); expect(robot.orientation).toBe 270
    robot.turnLeft(); expect(robot.orientation).toBe 180
    robot.turnLeft(); expect(robot.orientation).toBe 90
    robot.turnLeft(); expect(robot.orientation).toBe 0
    robot.turnLeft(); expect(robot.orientation).toBe 270

  it 'should move forward based on orientation', ->
    robot = new Robot(0, 0, 0)
    robot.goForward(); expect(robot.y).toBe -1

    robot = new Robot(0, 0, 180)
    robot.goForward(); expect(robot.y).toBe 1

    robot = new Robot(0, 0, 270)
    robot.goForward(); expect(robot.x).toBe -1

    robot = new Robot(0, 0, 90)
    robot.goForward(); expect(robot.x).toBe 1


class Robot
  up = 0; right = 90; down = 180; left = 270

  constructor: (@x, @y, @orientation) ->
    if @orientation < 0 then throw new Error 'Orientation should be 0, 90, 180, 270.'

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


class Map
  presentation = [
    [1, 1, 1, 1],
    [0, 0, 0, 1],
    [1, 1, 0, 1],
    [1, 1, 0, 1]
  ]