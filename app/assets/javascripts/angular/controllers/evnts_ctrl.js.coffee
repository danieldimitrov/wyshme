App.controller 'EvntsCtrl', ['$scope', 'Evnt', 'Auth', ($scope, Evnt, Auth) ->
  $scope.successEvnt = (data) ->
    console.log('success', data)
    $('#new-event-modal.modal').modal('hide')

  $scope.errorEvnt = (data, status) ->
    console.log('error', data, status)

  $scope.evntData = {}

  $scope.add = ->
    user_token = Auth.user.access_token
    if user_token? and user_token != ''
      $scope.evnt.add($scope.evntData, $scope.successEvnt, $scope.errorEvnt, user_token)

  $scope.evnt = Evnt
]
