App.factory 'Board', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  # TODO: Place root API's URL to configuration
  # FIXME: Add `access_token` to params to have API access
  $resource "#{API_HOST}/api/boards/:id", {id: '@id', access_token: Auth.user.access_token}
]
