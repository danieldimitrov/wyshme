App.factory 'Board', ['$resource', ($resource) ->
  # TODO: Place root API's URL to configuration
  # FIXME: Add `access_token` to params to have API access
  $resource 'http://localhost:2999/api/boards/:id', id: '@id'
]
