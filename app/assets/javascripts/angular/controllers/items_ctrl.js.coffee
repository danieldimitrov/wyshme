App.controller 'ItemsCtrl', ['$scope', '$filter', 'Item', 'Auth', ($scope, $filter, Item, Auth) ->
  # TODO: CatalogCtrl, WyshesCtrl, and ItemsCtrl contain the same code.
  #   Move it to AngularJS Service or so.
  $scope.categorizedItems = []
  $scope.selectedCategoryId = null
  $scope.selectedItem = null
  $scope.itemForEvent = null
  $scope.shareForm = recipients: '', message: ''

  updateItem = (item) ->
    angular.forEach $scope.items, (itm, key) ->
      $scope.items[key] = item if itm.id == item.id
    $scope.categorizedItems =
      $filter('categorizeItems')($scope.items, $scope.selectedCategoryId)

  $scope.$on 'categoryChanged', (event, args) ->
    $scope.selectedCategoryId = args.category_id
    $scope.categorizedItems =
      $filter('categorizeItems')($scope.items, args.category_id)

  $scope.selectItem = (item) ->
    $scope.selectedItem = item

  $scope.clearSelectedItem = ->
    $scope.selectedItem = null

  $scope.$on 'itemSelected', (event, args) ->
    $scope.selectItem(args.item)

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

  $scope.addItemToEvent = (item) ->
    $scope.itemForEvent = item

  $scope.shareItem = ->
    user_token = Auth.user.access_token
    if user_token? and user_token != ''
      Item.share(
        { id: $scope.selectedItem.id, access_token: user_token },
        $scope.shareForm,
        (share) ->
          # if share.id?
          #   console.log 'shared successfully'
          # else
          #   console.log 'item is not shared'
      )

    $scope.shareForm = recipients: '', message: ''
    $scope.clearSelectedItem()
]
