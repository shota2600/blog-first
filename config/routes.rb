Rails.application.routes.draw do
  # get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :blogs
  # resources :blogs, only: [:show]
  # resources :blogs, only: [:create, :new]
  resources :blogs, only: [:create, :new, :edit, :update, :destroy]
  
  root :to => "blogs#index"
  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  get "books/show"
  # get "/blogs/:id" => "blogs#show"
  # get "/blogs#show" => "edit_blog_path"
end
