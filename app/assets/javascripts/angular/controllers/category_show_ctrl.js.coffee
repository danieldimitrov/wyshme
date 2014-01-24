App.controller 'CategoryShowCtrl', ['$scope', 'Category', '$filter', ($scope, Category, $filter) ->
# TODO: change id: 1 to generic ID
  $scope.category = Category.get(id: 1)
  allItems = Category.items(id: 1)
  $scope.items = allItems

  $scope.order = [
    {label: "Price",value: "price"},
    {label: "Price DESC",value: "-price"},
    {label: "Date",value: "updated_at"},
    {label: "Date DESC",value: "-updated_at"},
    {label: "Likes",value: "likes"},
    {label: "Likes DESC",value: "-likes"},
    {label: "Wyshes",value: "wyshes"},
    {label: "Wyshes DESC",value: "-wyshes"}
  ]

  $scope.priceRanges = [
    {from : 0, to : 100},
    {from : 100, to : 300},
    {from : 300, to : 1000},
    {from : 1000, to : Infinity}
  ]

  $scope.changeOrder = (value) ->
    $scope.items = $filter('orderBy')(allItems, value)

  $scope.changePriceRange = (from, to) ->
    $scope.items = $filter('compareItemsPrices')(allItems, from, to)

  #TODO: change only for name and description
  $scope.changeKeyword = (value) ->
    $scope.items = $filter('filter')(allItems, keyword)

]
