Wyshme::Application.routes.draw do

  resources :lists,  only: [:index]
  resources :items,  only: [:index]

  get 'templates(/:action)', controller: :templates

  get 'account' => 'account#index'

  get 'catalog', to: 'pages#catalog'
  get 'events',  to: 'pages#events'
  get 'wysh',    to: 'pages#wysh'

  root 'items#index'

end
