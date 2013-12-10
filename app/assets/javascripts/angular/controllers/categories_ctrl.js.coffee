App.controller 'CategoriesCtrl', ['$scope', 'Category', ($scope, Category) ->
  $scope.categories = [
      id: 0
      name: 'Anything'
    ,
      id: 1
      name: 'Popular'
    ,
      id: 2
      name: 'Gifts'
    ,
      id: 3
      name: 'Animals'
    ,
      id: 4
      name: 'Art'
    ,
      id: 5
      name: 'Design'
  ]
]
