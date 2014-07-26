Flix::Application.routes.draw do
  get "sessions/new"
	resource :session
	get 'signup' => 'users#new'
  resources :users

  root "movies#index"
  resources :movies do
  	 resources :reviews
  end
end
