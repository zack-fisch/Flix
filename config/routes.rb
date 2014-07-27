Flix::Application.routes.draw do

	resource :session
	get 'signin' => 'sessions#new'
	get 'signup' => 'users#new'
  resources :users

  root "movies#index"
  resources :movies do
  	 resources :reviews
  end
end
