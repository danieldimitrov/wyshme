App.factory 'Auth', ($http, $rootScope, $cookieStore, API_HOST) ->
  currentUser = $cookieStore.get('user') or { email: '', access_token: '' }

  changeUser = (user) ->
    $cookieStore.put('user', user)
    $.extend true, currentUser, user

  # returns associative array below
  isLoggedIn: (user) ->
    if not user?
      user = currentUser
    user.email != ''

  login: (loginData, onSuccess, onError) ->
    $http
      url: "#{API_HOST}/users/sign_in.json"
      method: 'POST'
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: $.param(loginData)
    .success (data) ->
      changeUser(data)
      onSuccess(data)
    .error(onError)

  register: (registrationData, onSuccess, onError) ->
    $http
      url: "#{API_HOST}/users.json"
      method: 'POST'
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: $.param(registrationData)
    .success (data) ->
      changeUser(data)
      onSuccess(data)
    .error(onError)

  logout: ->
    $cookieStore.remove('user')
    currentUser = { email: '', access_token: '' }

  user: currentUser
