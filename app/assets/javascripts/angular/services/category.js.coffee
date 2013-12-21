App.factory 'Category', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  # TODO: Place root API's URL to configuration
  $resource "#{API_HOST}/api/categories/:id", id: '@id'
]
