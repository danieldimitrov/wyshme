window.App = angular.module('WyshMe', ['ngResource'])

App.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
]
