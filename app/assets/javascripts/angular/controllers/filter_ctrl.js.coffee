App.controller 'FilterCtrl', ['$scope', '$filter', ($scope, $filter) ->
  allItems = $scope.items
  sortByFilter = null
  priceRangeFilter = null
  fromDateFilter = null
  toDateFilter = null
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

  $scope.setFromDateFilter = (value) ->
    fromDateFilter = value
    filterItems()

  $scope.setToDateFilter = (value) ->
    toDateFilter = value
    filterItems()

  filterItems = ->
    filteredItems = allItems
    if keywordFilter != null && keywordFilter.length > 1
      filteredItems = filterByKeyword(filteredItems)

    filteredItems = filterByOrder(filteredItems)

    if priceRangeFilter != null
      filteredItems = filterByPriceRange(filteredItems)

    if fromDateFilter != null
      filteredItems = filterByFromDate(filteredItems)

    if toDateFilter != null
      filteredItems = filterByToDate(filteredItems)

    $scope.items = filteredItems

  filterByOrder = (items) ->
    $filter('orderBy')(items, sortByFilter)

  filterByPriceRange = (items) ->
    $filter('compareItemsPrices')(items, priceRangeFilter.from, priceRangeFilter.to)

  filterByKeyword = (items) ->
    nameFilter = $filter('filter')(items, {name: keywordFilter}, false)
    descriptionFilter = $filter('filter')(items, {description: keywordFilter}, false)
    $scope.items = $.unique($.merge(nameFilter, descriptionFilter))

  filterByFromDate = (items) ->
    $filter('filterFromDate')(items, fromDateFilter)

  filterByToDate = (items) ->
    $filter('filterToDate')(items, toDateFilter)

  $scope.resetAllFilters = ->
    sortByFilter = null
    priceRangeFilter = null
    fromDateFilter = null
    toDateFilter = null
    keywordFilter = null
    filterItems()
    setDefaultSelectValues()

  setDefaultSelectValues = ->
    $("#keyword").val('')
    $("#sortby_text").html('Sort By')
    $("#pricerange_text").html('Price Range')
    $("#from_date").val('From date')
    $("#to_date").val('To date')
    return

]
