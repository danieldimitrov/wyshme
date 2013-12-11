App.controller 'AuthCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.successAuth = (data) ->
    console.log('success', data)
    # Store user data in the cookies.
    # Show user's profile partial and hide links to login/register
    # forms.
    # Close login/register dialog

  $scope.errorAuth = (data, status) ->
    console.log('error', data, status)
    # If response code is 422 on register it means error.
    # Possibly, email is already taken or password is not safe

  $scope.loginData = {}
  $scope.registrationData = {}

  $scope.login = ->
    Auth.login($scope.loginData, $scope.successAuth, $scope.errorAuth)

  $scope.register = ->
    Auth.register($scope.registrationData, $scope.successAuth, $scope.errorAuth)

  $scope.auth = Auth
]
