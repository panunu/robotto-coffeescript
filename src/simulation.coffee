class Simulation
  robot = null
  ratio = 50

  constructor: (@map, @brain) ->
    @robot = new Robot(0, 0, 180)
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



