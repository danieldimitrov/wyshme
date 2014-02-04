App.controller 'ListsCtrl', ['$scope', 'Auth', 'List', ($scope, Auth, List) ->
  user_token = Auth.user.access_token
  $scope.items = List.query(access_token: user_token)
]
