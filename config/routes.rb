Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:new, :create, :index, :show] do
  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # post 'lists', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show', as: :list do
    resources :bookmarks, only: [:new, :create, :destroy]
    # get 'list/:id/bookmarks/new', to: 'bookmarks#new'
    # post 'list/:id/bookmarks', to: 'bookmarks#create'
  end

end
