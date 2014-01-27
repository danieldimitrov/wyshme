App.factory 'Category', ['$resource', 'API_HOST', ($resource, API_HOST) ->
  # TODO: Place root API's URL to configuration
  $resource "#{API_HOST}/api/categories/:id", id: '@id',
    featured_items:
      method: 'GET'
      url: "#{API_HOST}/api/categories/:id/featured_items"
      isArray: true
    allFeaturedItems:
      method: 'GET'
      url: "#{API_HOST}/api/categories/featured_items"
      isArray: true
    items:
      method: 'GET'
      url: "#{API_HOST}/api/categories/:id/items"
      isArray: true
]
