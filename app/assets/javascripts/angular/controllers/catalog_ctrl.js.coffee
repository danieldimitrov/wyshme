App.controller 'CatalogCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.allFeaturedItems = Category.allFeaturedItems()

]
