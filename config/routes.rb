Rails.application.routes.draw do

   devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  get '/search' => 'search#search' #検索機能

  get 'relationships/following' #フォロー機能
  get 'relationships/follower'

  resources :users do
    member do
      get :following, :followers
    end
  end


  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books

  resources :books do
  	resource :favorites, only: [:create, :destroy] #いいね機能
  	resources :book_comments, only: [:create, :destroy] #コメント機能
  end

  resources :relationships, only: [:create, :destroy]

  resources :groups # グループ機能

  resources :messages, only: [:show, :create] # DM機能

  resources :groups do
    get "join" => "groups#join"
  end

end