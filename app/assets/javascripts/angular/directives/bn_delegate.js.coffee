App.directive 'bnDelegate', ($parse) ->
  link = ($scope, element, attributes) ->
    config = attributes.bnDelegate.split('|')
    
    if config.length is 3
      target = $(config[0].trim())
      func = config[1].trim()
      action = config[2].trim()
    else
      throw 'bnDelegate: configuration is wrong!'

    element.on 'click.bnDelegate', (event) ->
      # TODO: remove this hack which depends on dimmer container behaviour
      target.css('z-index', 9999) if func is 'dimmer'
      target[func](action)
    
    $scope.$on '$destroy', (event) ->
      element.off 'click.bnDelegate'
  
  # Return the directive configuration.
  link: link
  restrict: 'A'
