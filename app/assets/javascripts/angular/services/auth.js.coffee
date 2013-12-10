App.factory 'Auth', ($http) ->
  login: (loginData, onSuccess, onError) ->
    $http
      url: 'http://wyshme-api.herokuapp.com/users/sign_in.json'
      method: 'POST'
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: $.param(loginData)
    .success(onSuccess)
    .error(onError)
  register: (registrationData, onSuccess, onError) ->
    $http
      url: 'http://wyshme-api.herokuapp.com/users.json'
      method: 'POST'
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: $.param(registrationData)
    .success(onSuccess)
    .error(onError)
