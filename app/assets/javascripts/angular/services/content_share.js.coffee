App.factory 'ContentShare', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/content_shares/:id", { id: '@id' }
]
