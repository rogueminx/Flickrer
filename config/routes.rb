Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  resources :questions do
    resources :answers
  end


end
