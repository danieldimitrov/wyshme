App.controller 'CategoryShowCtrl', ['$scope', 'Auth', 'Category', 'Item', '$filter', ($scope, Auth, Category, Item, $filter) ->
  category_id = $('#div-data-category').data("category")
  $scope.category = Category.get(id: category_id)
  items = Category.items(id: category_id)
  $scope.items =
    all: items
    filtered: items

  $scope.selectedItem = null
  $scope.shareForm = recipients: '', message: ''

  $scope.selectItem = (item) ->
    $scope.selectedItem = item

  $scope.clearSelectedItem = ->
    $scope.selectedItem = null

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
