App.controller 'CategoryShowCtrl', ['$scope', 'Category', '$filter', ($scope, Category, $filter) ->
  category_id = $('#div-data-category').data("category")
  $scope.category = Category.get(id: category_id)
  $scope.items = Category.items(id: category_id)
]
