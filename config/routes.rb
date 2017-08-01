Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :actors
  resources :bookcases do
    member do
      get 'upload_picture/edit', controller: 'bookcases/upload_picture', action: :edit
      put 'upload_picture/', controller: 'bookcases/upload_picture', action: :update
    end
  end
  resources :books
  resources :comments
  resources :movies
end
