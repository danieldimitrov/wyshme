App.factory 'Item', ['$resource', ($resource) ->
  # TODO: Place root API's URL to configuration
  $resource 'http://wyshme-api.herokuapp.com/api/items/:id', id: '@id'
]
