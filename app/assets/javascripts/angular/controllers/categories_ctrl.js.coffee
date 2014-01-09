App.controller 'CategoriesCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.currentCat = 'All Items'

  $scope.selectCategory = (category_id) ->
    $scope.$emit 'categoryChangeEmit', category_id: category_id
    $scope.currentCat = 'Yeah'

  $scope.categories = Category.query()
]
