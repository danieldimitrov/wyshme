App.controller 'AuthCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.successAuth = (data) ->
    $('#register-modal.modal').modal('hide');
    $('#login-modal.modal').modal('hide');
    # Store user data in the cookies.
    # Show user's profile partial and hide links to login/register
    # forms.
    # Close login/register dialog

  $scope.errorAuth = (data, status) ->
    # If response code is 422 on register it means error.
    # Possibly, email is already taken or password is not safe

  $scope.loginData = {}
  $scope.registrationData = {}

  $scope.login = ->
    $scope.auth.login($scope.loginData, $scope.successAuth, $scope.errorAuth)

  $scope.register = ->
    $scope.auth.register($scope.registrationData, $scope.successAuth, $scope.errorAuth)

  $scope.auth = Auth
]
