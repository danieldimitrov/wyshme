App.factory 'Item', ['$resource', ($resource) ->
  # TODO: Place root API's URL to configuration
  $resource 'http://localhost:2999/api/items/:id', id: '@id'
]
