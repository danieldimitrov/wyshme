App.controller 'CategoriesCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.categories = Category.query()
]
