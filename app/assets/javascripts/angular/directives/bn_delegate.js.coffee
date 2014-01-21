App.directive 'bnDelegate', ($parse) ->
  link = ($scope, element, attributes) ->
    config = attributes.bnDelegate.split('|')
    
    if config.length is 3
      target = $(config[0].trim())
      func = config[1].trim()
      expression = config[2].trim()
    else
      throw 'bnDelegate: configuration is wrong!'

    expressionHandler = $parse(expression)
    
    element.on 'click.bnDelegate', (event) ->
      event.preventDefault()

      target[func]('show')

      localScope = $(event.target).scope()
      localScope.$apply ->
        expressionHandler localScope
    
    $scope.$on '$destroy', (event) ->
      element.off 'click.bnDelegate'
  
  # Return the directive configuration.
  link: link
  restrict: 'A'
