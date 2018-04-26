Rails.application.routes.draw do
  root :to => 'images#index'

  devise_for :users

  post 'images/:id/new_tag', to: 'images#new_tag', as: :new_tag

  resources :images do
    resources :comments
  end


end
