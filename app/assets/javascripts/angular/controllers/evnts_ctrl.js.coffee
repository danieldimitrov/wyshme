App.controller 'EvntsCtrl', ['$scope', 'Evnt', 'Auth', ($scope, Evnt, Auth) ->
  successEvnt = (data) ->
    $('#add-new-event-modal.modal').modal('hide')

  $scope.evntData = {}

  $scope.add = ->
    user_token = Auth.user.access_token
    if user_token? and user_token != ''
      Evnt.save(access_token: user_token, $scope.evntData, successEvnt)
]
