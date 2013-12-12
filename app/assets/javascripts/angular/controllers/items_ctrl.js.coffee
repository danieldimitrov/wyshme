App.controller 'ItemsCtrl', ['$scope', 'Item', ($scope, Item) ->
  $scope.selectedCategoryId = null

  $scope.$on 'categoryChanged', (event, args) ->
    $scope.selectedCategoryId = args.category_id

  $scope.itemMatchsCategory = (item) ->
    matchs = false
    if not $scope.selectedCategoryId? or item.categories.length == 0
      matchs = true
    else
      angular.forEach item.categories, (category) ->
        matchs = true if category.id == $scope.selectedCategoryId

    matchs

  $scope.items = Item.query()
]
