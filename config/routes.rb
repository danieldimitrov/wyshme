Wyshme::Application.routes.draw do

  resources :lists,  only: [:index]
  resources :items,  only: [:index]
  resources :catalog, only: [:index]
  resources :categories, only: [:show]

  get 'templates(/:action)', controller: :templates

  get 'account' => 'account#index'

  get 'events',  to: 'pages#events'
  get 'wysh',    to: 'pages#wysh'

  root 'items#index'

  # Mock Pages
  get '/mock/wysh-list/shared',     to: 'mocks#shared_wysh',   as: 'mock_shared_wysh'   # Shared With Me (Wysh List)
  get '/mock/wysh-list/search',     to: 'mocks#search_wysh',   as: 'mock_search_wysh'   # Search (Wysh List)
  get '/mock/wysh-list/suggested',  to: 'mocks#suggested',     as: 'mock_suggested'     # Suggested (Wysh List)
  get '/mock/events/shared',        to: 'mocks#shared_events', as: 'mock_shared_events' # Shared Events (Events)
  get '/mock/events/search',        to: 'mocks#search_events', as: 'mock_search_events' # Search (Events)
  get '/mock/peeps/see-all',        to: 'mocks#see_all',       as: 'mock_see_all'       # Ses All (Peeps)

end
