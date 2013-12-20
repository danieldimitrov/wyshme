App.factory 'Item', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/items/:id", { id: '@id' },
    like:
      method: 'PUT'
      url: "#{API_HOST}/api/items/:id/like"
    wysh:
      method: 'PUT'
      url: "#{API_HOST}/api/items/:id/wysh"
]
