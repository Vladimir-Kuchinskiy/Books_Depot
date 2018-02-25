Rails.application.routes.draw do

  resources :authors
  resources :relations

  resources :groups do
    get "add_book", on: :member
  end

  resources :groupings

  resources :books do
    get "add_author", on: :member
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users

  root to: "books_catalog#index"

end
