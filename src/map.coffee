class Map
  presentation = [
    [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    [0, 0, 0, 1, 1, 1, 1, 0, 0, 5]
    [1, 1, 0, 0, 0, 0, 1, 0, 1, 1]
    [1, 1, 1, 1, 1, 0, 1, 0, 0, 1]
    [1, 1, 1, 0, 0, 0, 1, 1, 0, 1]
    [1, 1, 1, 0, 1, 1, 1, 1, 0, 1]
    [1, 1, 1, 0, 0, 1, 0, 0, 0, 1]
    [1, 1, 1, 1, 0, 0, 0, 1, 1, 1]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  ] # Figure out a nicer way to present simple coordinates: maybe parse a string to an array like this?

  getPresentation: -> presentation

(exports ? this).Map = Map