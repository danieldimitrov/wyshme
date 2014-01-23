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

#App.constant 'API_HOST', 'http://wyshme-api.herokuapp.com'
App.constant 'API_HOST', 'http://localhost:2999'

App.run ($rootScope) ->
  $rootScope.$on 'categoryChangeEmit', (event, args) ->
    $rootScope.$broadcast 'categoryChanged', args

App.controller 'PagesCtrl', ['$scope', ($scope) ->
]
