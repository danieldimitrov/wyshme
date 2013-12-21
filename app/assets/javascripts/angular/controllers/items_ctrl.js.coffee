App.controller 'ItemsCtrl', ['$scope', '$filter', 'Item', 'Auth', ($scope, $filter, Item, Auth) ->
  $scope.categorizedItems = []
  $scope.selectedCategoryId = null
  $scope.selectedItem = null

  updateItem = (item) ->
    angular.forEach $scope.items, (itm, key) ->
      $scope.items[key] = item if itm.id == item.id
    # It must update items' list, which leads to grid redraw, but it is not...
    $scope.categorizedItems =
      $filter('categorizeItems')($scope.items, $scope.selectedCategoryId)

  $scope.$on 'categoryChanged', (event, args) ->
    $scope.selectedCategoryId = args.category_id
    $scope.categorizedItems =
      $filter('categorizeItems')($scope.items, args.category_id)

  $scope.selectItem = (item) ->
    $scope.selectedItem = item

  $scope.items = Item.query null, (items) ->
    $scope.categorizedItems =
      $filter('categorizeItems')(items, $scope.selectedCategoryId)

  $scope.likeItem = (item) ->
    user_token = Auth.user.access_token
    if user_token? and user_token != ''
      Item.like { id: item.id, access_token: user_token }, null, (itm) ->
        updateItem itm

  $scope.wyshItem = (item) ->
    user_token = Auth.user.access_token
    if user_token? and user_token != ''
      Item.wysh { id: item.id, access_token: user_token }, null, (itm) ->
        updateItem itm
]
