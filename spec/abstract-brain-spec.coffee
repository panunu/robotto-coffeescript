AbstractBrain = require("../src/abstract-brain").AbstractBrain

describe 'AbstractBrain', ->

  it 'should be extended', ->
    expect(-> new AbstractBrain('zombie').think()).toThrow 'AbstractBrain should be extended: implement think()'
