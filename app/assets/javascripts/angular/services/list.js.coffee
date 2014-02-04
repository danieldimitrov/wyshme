App.factory 'List', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/lists/:id", {id: '@id'}
]
