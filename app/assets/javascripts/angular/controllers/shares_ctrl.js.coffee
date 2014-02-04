App.controller 'SharesCtrl', ['$scope', '$location', 'ContentShare', ($scope, $location, ContentShare) ->
  $scope.content = ContentShare.get(hash_id: extract_hash_id())

  extract_hash_id = ->
    path = $location.path()
    path.substr(path.lastIndexOf('/')+1, path.length)

]
