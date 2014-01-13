App.factory 'Evnt', ($http, $resource, API_HOST) ->
  # FIXME: Add `access_token` to params to have API access

  add: (evntData, onSuccess, onError) ->
    console.log 'HEY OH'
    $http
      method: 'POST'
      url: "#{API_HOST}/api/events"
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: $.param(evntData)
    .success (data) ->
      onSuccess(data)
    .error(onError)
