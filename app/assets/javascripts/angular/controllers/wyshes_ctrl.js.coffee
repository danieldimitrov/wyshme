App.controller 'WyshesCtrl', ['$scope', '$filter', 'Item', 'Auth', ($scope, $filter, Item, Auth) ->
  # TODO: CatalogCtrl, WyshesCtrl, and ItemsCtrl contain the same code.
  #   Move it to AngularJS Service or so.
  $scope.wyshedFilteredItems = []
  $scope.selectedItem = null
  $scope.itemForEvent = null

  $scope.wyshedItems = Item.wyshed(
    { access_token: Auth.user.access_token }, null, (items) ->
      console.log 'wyshedItems', items
      $scope.wyshedFilteredItems = items
  )

  $scope.selectItem = (item) ->
    $scope.selectedItem = item

  $scope.clearSelectedItem = ->
    $scope.selectedItem = null

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
]
