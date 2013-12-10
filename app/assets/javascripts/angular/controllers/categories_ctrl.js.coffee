App.controller 'CategoriesCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.categories = [
    {
      id: 0
      name: 'Anything'
    },
    {
      id: 1
      name: 'Design'
    }
  ]
]
