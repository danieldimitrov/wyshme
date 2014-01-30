App.factory 'Evnt',['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/events/:id", { id: '@id' }
]
