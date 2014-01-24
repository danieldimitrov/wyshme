App.controller 'CategoryShowCtrl', ['$scope', 'Category', '$filter', ($scope, Category, $filter) ->
# TODO: change id: 1 to generic ID
  $scope.category = Category.get(id: 1)
  allItems = Category.items(id: 1)
  $scope.items = allItems
  sortByFilter = null
  priceRangeFilter = null
  dateRangeFilter = null
  keywordFilter = null

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
    {from : 1000, to : 5000}
  ]

  $scope.setSortByFilter = (value) ->
    sortByFilter = value
    filterItems()

  $scope.setPriceRangeFilter = (value) ->
    priceRangeFilter = value
    filterItems()

  $scope.setKeywordFilter = (value) ->
    keywordFilter = value
    filterItems()

  filterItems = ->
    filteredItems = filterByOrder(allItems)
    if priceRangeFilter != null
      filteredItems = filterByPriceRange(filteredItems)
    filteredItems = filterByKeyword(filteredItems)
    $scope.items = filteredItems

  filterByOrder = (items) ->
    $filter('orderBy')(items, sortByFilter)

  filterByPriceRange = (items) ->
    $filter('compareItemsPrices')(items, priceRangeFilter.from, priceRangeFilter.to)

  #TODO: change only for name and description
  filterByKeyword = (items) ->
    $filter('filter')(items, keywordFilter)

]
