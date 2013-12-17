App.directive "bnDelegate", ($parse) ->
  # I bind the DOM and event handlers to the scope.
  link = ($scope, element, attributes) ->
    
    # Right now, the delegate can be defined as
    # either selector and an expression; or simply
    # as an expression.
    config = attributes.bnDelegate.split("|")
    
    # Only an expression has been defined - default
    # the selector to any anchor link.
    if config.length is 1
      selector = "a"
      expression = config[0]
    
    # Both selector and expression are defined.
    else
      selector = config[0]
      expression = config[1]
    
    # Parse the expression into an invokable
    # function. This way, we don't have to re-parse
    # it every time the event handler is triggered.
    expressionHandler = $parse(expression)
    
    # -------------------------------------- //
    # -------------------------------------- //
    
    # Bind to the click (currently only supported
    # event type) to the root element and listen for
    # clicks on the given selector.
    element.on "click.bnDelegate", selector, (event) ->
      
      # Prevent the default behavior - this is
      # not a "real" link.
      event.preventDefault()

      $('#selected-item').dimmer('show')
      
      # Find the scope most local to the target
      # of the click event.
      localScope = $(event.target).scope()
      
      # Invoke the expression in the local scope
      # context to make sure we adhere to the
      # proper scope chain prototypal inheritance.
      localScope.$apply ->
        expressionHandler localScope

    # -------------------------------------- //
    # -------------------------------------- //
    
    # When the scope is destroyed, clean up.
    $scope.$on "$destroy", (event) ->
      element.off "click.bnDelegate"
  
  # Return the directive configuration.
  link: link
  restrict: "A"
