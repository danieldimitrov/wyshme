App.factory 'Item', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  $resource "#{API_HOST}/api/items/:id", { id: '@id' },
    like:
      method: 'PUT'
      url: "#{API_HOST}/api/items/:id/like"
    wysh:
      method: 'PUT'
      url: "#{API_HOST}/api/items/:id/wysh"
    featured:
      method: 'GET'
      url: "#{API_HOST}/api/items/featured"
      isArray: true
    liked:
      method: 'GET'
      url: "#{API_HOST}/api/items/liked"
      isArray: true
    wyshed:
      method: 'GET'
      url: "#{API_HOST}/api/items/wyshed"
      isArray: true
]
