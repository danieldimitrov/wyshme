App.controller 'ItemsCtrl', ['$scope', '$filter', 'Item', ($scope, $filter, Item) ->
  $scope.categorizedItems = []
  $scope.selectedCategoryId = null
  $scope.selectedItem = null

  $scope.$on 'categoryChanged', (event, args) ->
    $scope.selectedCategoryId = args.category_id
    $scope.categorizedItems =
      $filter('categorizeItems')($scope.items, args.category_id)

  $scope.selectItem = (item) ->
    $scope.selectedItem = item

  $scope.items = Item.query null, (items) ->
    $scope.categorizedItems = $filter('categorizeItems')(items, $scope.selectedCategoryId)

]
