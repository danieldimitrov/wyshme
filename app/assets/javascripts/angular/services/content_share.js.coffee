App.factory 'ContentShare', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/contant_shares/:hash_id", { hash_id: '@id' }
]
