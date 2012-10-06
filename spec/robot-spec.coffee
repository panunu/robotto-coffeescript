Robot         = require("../src/robot").Robot
AbstractBrain = require("../src/abstract-brain").AbstractBrain
Map           = require("../src/map").Map
# TODO: Improve requirements, e.g. a suite file

describe 'Robot', ->
  robot = null

  beforeEach ->
    robot = new Robot(1, 1, 0)
    map = new Map()
    map.setPresentation([
      [0, 0, 0, 0]
      [0, 0, 0, 0]
      [0, 0, 0, 0]
      [0, 0, 0, 0]
    ])
    robot.setMap map

  it 'should have x and y', ->
    robot = new Robot(1, 2, 0)
    expect(robot.x).toBe 1
    expect(robot.y).toBe 2

  it 'should have orientation', ->
    expect(robot.orientation).toBe 0

  it 'should throw if setup is invalid', ->
    expect(-> new Robot(0, 0, -1).checkSetup()).toThrow 'Orientation should be 0, 90, 180, 270'
    expect(-> new Robot(0, 0, 0).checkSetup()).toThrow 'Robot should have a brain: use setBrain()'

    robot = new Robot(0, 0, 0); robot.setBrain(new AbstractBrain('dumb'))
    expect(-> robot.checkSetup()).toThrow 'Robot should have a map: use setMap()'

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

  it 'should move forward based on orientation: up', ->
    robot.goForward(); expect(robot.y).toBe 0

  it 'should move forward based on orientation: right', ->
    robot.turnRight() # 90
    robot.goForward(); expect(robot.x).toBe 2

  it 'should move forward based on orientation: down', ->
    robot.turnRight(); robot.turnRight() # 180
    robot.goForward(); expect(robot.y).toBe 2

  it 'should move forward based on orientation: left', ->
    robot.turnLeft() # 270
    robot.goForward(); expect(robot.x).toBe 0

  it 'should not move forward if there is a wall', ->
    robot = new Robot(0, 0, 90)
    map = new Map()
    map.setPresentation([[0, 1]])
    robot.setMap map

    expect(robot.goForward()).toBe false

