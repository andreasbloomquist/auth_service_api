Rails.application.routes.draw do
  get 'receipts/index'

  get 'receipts/create'

  root to: 'welcome#index'

  resources :stores

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  post '/stores/:id/update_token', to: 'stores#update_token', as: 'update_token'

  get '/receipts', to: 'receipts#index', as: 'all_receipts'
  post '/receipts', to: 'receipts#create', as: 'create_receipt' 

  get '/account', to: 'stores#show', as: 'account'
end
