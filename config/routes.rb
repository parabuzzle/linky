Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :links

  get '/search', to: 'search#index'

  root to: 'links#index'

  match '*path' => 'redirect#index', via: [:get]

end
