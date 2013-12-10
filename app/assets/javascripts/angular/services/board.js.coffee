App.factory 'Board', ['$resource', ($resource) ->
  # TODO: Place root API's URL to configuration
  # FIXME: Add `access_token` to params to have API access
  $resource 'http://wyshme-api.herokuapp.com/api/boards/:id', {id: '@id', access_token: Auth.user.access_token}
]
