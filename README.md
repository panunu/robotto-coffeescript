# Robotto-coffee

The goal is to make an environment where one can practice writing Coffeescript and a simple AI.
This environment provides the following: a virtual robot, that can move and sense the environment with simple sensors.
One is supposed to provide a "brain" for the robot which decides what to do.

## TODOS

- Fix tests
- Actual task/goal for the robot (e.g. find a ball)
- Sensors as assignable components
- 360 movement possibility (JS-based collision detection)
- Lot of other stuff.

## Development

Compile coffees to JS with Node (obs. example with global npm module)

```coffee -cw -o js src/*.coffee```

You can run tests with Jasmine.

```jasmine-node --color --autotest --coffee spec```
