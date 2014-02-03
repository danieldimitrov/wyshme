App.controller 'CatalogCtrl', ['$scope', '$window', 'Auth', 'Category', 'Item', ($scope, $window, Auth, Category, Item) ->
  # TODO: CatalogCtrl, WyshesCtrl, and ItemsCtrl contain the same code.
  #   Move it to AngularJS Service or so.
  $scope.selectedItem = null
  $scope.itemForEvent = null
  $scope.shareForm = recipients: '', message: ''

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

  $scope.redirectToCategory = (category_id) ->
    $window.location.href = "/categories/#{category_id}"

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
