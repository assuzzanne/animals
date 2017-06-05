Rails.application.routes.draw do
  
  root 'admin#index'

  #get 'admin/index'

  #get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :animals

get '/homepage', to: 'animals#index'

get 'admin' => 'admin#index'

get 'register', to: 'users#new'

get 'logout', to: 'sessions#destroy'
	

	controller :sessions do 
		get 'login' => :new
		post 'login' => :create
		delete 'logout' => :destroy
	end
end
