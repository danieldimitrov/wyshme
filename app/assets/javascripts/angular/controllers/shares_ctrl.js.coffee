App.controller 'SharesCtrl', ['$scope', '$location', 'ContentShare', ($scope, $location, ContentShare) ->
  extract_hash_id = ->
    path = $location.absUrl()
    path.substr(path.lastIndexOf('/') + 1, path.length)

  $scope.share = ContentShare.get(id: extract_hash_id())

]
