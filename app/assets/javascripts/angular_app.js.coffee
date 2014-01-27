window.App = angular.module('WyshMe', ['ngResource', 'ngCookies', 'akoenig.deckgrid'])

App.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
]

App.filter 'categorizeItems', ->
  (items, categoryId) ->
    categorized = []
    angular.forEach items, (item) ->
      if item.categories.length == 0 or not categoryId?
        categorized.push item
      else
        angular.forEach item.categories, (category) ->
          categorized.push(item) if category.id == categoryId

    categorized

App.filter 'compareItemsPrices', ->
  (items, from, to) ->
    itemsInRange = []
    angular.forEach items, (item) ->
      if item.price >= from && item.price <= to
        itemsInRange.push item

    itemsInRange

App.filter 'filterFromDate', ->
  (items, from) ->
    itemsInRange = []
    fromTime = new Date(from).getTime()
    angular.forEach items, (item) ->
      itemTime = new Date(item.updated_at).getTime()
      if itemTime >= fromTime
        itemsInRange.push item

    itemsInRange

App.filter 'filterToDate', ->
  (items, to) ->
    itemsInRange = []
    toTime = new Date(to).getTime()
    angular.forEach items, (item) ->
      itemTime = new Date(item.updated_at).getTime()
      if itemTime <= toTime
        itemsInRange.push item

    itemsInRange

App.constant 'API_HOST', 'http://wyshme-api.herokuapp.com'
#App.constant 'API_HOST', 'http://localhost:2999'

App.run ($rootScope) ->
  $rootScope.$on 'categoryChangeEmit', (event, args) ->
    $rootScope.$broadcast 'categoryChanged', args

App.controller 'PagesCtrl', ['$scope', ($scope) ->
]
