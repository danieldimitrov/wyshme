App.controller 'CategoriesCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.selectCategory = (category_id) ->
    $scope.$emit 'categoryChangeEmit', category_id: category_id

  $scope.categories = Category.query()
]
