App.controller 'CatalogCtrl', ['$scope', 'Category', '$log', ($scope, Category, $log) ->
  $scope.allFeaturedItems = Category.allFeaturedItems ->
    $log.info($scope.allFeaturedItems)

]
