App.factory 'Evnt',['$http', '$resource', 'API_HOST', ($http, $resource, API_HOST) ->
  # FIXME: Add `access_token` to params to have API access

  add: (evntData, onSuccess, onError, user_token) ->
    # $http
    #   method: 'POST'
    #   url: "#{API_HOST}/api/events.json"
    #   headers:
    #     'Content-Type': 'application/x-www-form-urlencoded'
    #   data: $.param(evntData)
    # .success (data) ->
    #   onSuccess(data)
    # .error(onError)
    $resource "#{API_HOST}/api/events.json", {access_token: user_token}, save: { method: 'POST'}
]
