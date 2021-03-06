Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'computers#index'
  get '/api_credentials', to: 'computers#credentials', as: 'api_credentials'
  get '/computers/:id/links', to: 'computers#link', as: 'computers_link'
  get '/computers/:id/policy', to: 'computers#policy', as: 'computers_policy'
end
