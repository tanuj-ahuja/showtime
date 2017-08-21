Rails.application.routes.draw do
  
   get 'friendships/create'
   get 'friendships/update'
   get  'friendships/destroy'

	root 'home#index'
 
  get '/mymovies', to:'movie_relations#mymovies'
  get '/toprated', to:'home#toprated'
  get '/nowshowing', to:'home#nowshowing'
  get '/upcoming', to:'home#upcoming'
  get '/findfriends',    to:'users#findfriends'
  get '/search', to: 'home#search'
  get 'genre',to: 'home#genre'
  get '/friendrequest', to: 'users#confirm'
  get '/myfriends',to: 'users#myfriends'
    get '/feed',to: 'users#feed'



  devise_for :users
  resources :users, :only => [:show]
  resources :home
  resources :movie_relations
  resources :friendships, only: [:create, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
