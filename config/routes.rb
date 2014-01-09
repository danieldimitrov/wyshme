Wyshme::Application.routes.draw do

  resources :lists, only: [:index]
  resources :items, only: [:index]

  get 'templates(/:action)', controller: :templates

  get 'account' => 'account#index'

  root 'items#index'

end
