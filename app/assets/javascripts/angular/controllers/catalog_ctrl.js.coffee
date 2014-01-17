App.controller 'CatalogCtrl', ['$scope', 'Category', '$log', ($scope, Category, $log) ->
  $scope.allFeaturedItems = Category.allFeaturedItems null, (items)->
    $log.info(items)

  $scope.firstItem = $scope.allFeaturedItems[0]
]
