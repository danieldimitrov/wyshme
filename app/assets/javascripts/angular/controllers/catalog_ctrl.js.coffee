App.controller 'CatalogCtrl', ['$scope', 'Category', 'Item', ($scope, Category, Item) ->
  # TODO: CatalogCtrl, WyshesCtrl, and ItemsCtrl contain the same code.
  #   Move it to AngularJS Service or so.
  $scope.selectedItem = null
  $scope.itemForEvent = null

  $scope.allFeaturedItems = Item.featured(page: 0, per_page: 5)

  $scope.categories = Category.query(page: 0, per_page: 100)

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
