window.App = angular.module('WyshMe', ['ngResource', 'ngCookies'])

App.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
]

App.filter 'categorizeItems', ->
  (items, categoryId) ->
    return items if not categoryId?

    categorized = []
    angular.forEach items, (item) ->
      if item.categories.length == 0
        categorized.push item
      else
        angular.forEach item.categories, (category) ->
          categorized.push(item) if category.id == categoryId

    categorized

App.run ($rootScope) ->
  $rootScope.$on 'categoryChangeEmit', (event, args) ->
    $rootScope.$broadcast 'categoryChanged', args
