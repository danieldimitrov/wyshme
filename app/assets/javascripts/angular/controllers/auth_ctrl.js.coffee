App.controller 'AuthCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.successAuth = (data) ->
    console.log('success', data)

  $scope.errorAuth = (data, status) ->
    console.log('error', data, status)

  $scope.loginData = {}
  $scope.registrationData = {}

  $scope.login = ->
    Auth.login($scope.loginData, $scope.successAuth, $scope.errorAuth)

  $scope.register = ->
    Auth.register($scope.registrationData, $scope.successAuth, $scope.errorAuth)

]
