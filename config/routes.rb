Rails.application.routes.draw do
  root "modes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/modes', to: 'modes#index'
  get '/modes/new', to: 'modes#new'
  get '/modes/:id', to: 'modes#show'
  get '/modes/:id/keymaps', to: 'modes/keymaps#index'
  post '/modes', to: 'modes#create'
  get '/modes/:id/edit', to: 'modes#edit'
  patch '/modes/:id', to: 'modes#update'
  delete '/modes/:id', to: 'modes#destroy'

  get '/modes/:id/keymaps/new', to: 'modes/keymaps#new'
  post '/modes/:id/keymaps', to: 'modes/keymaps#create'

  get '/keymaps', to: 'keymaps#index'
  get '/keymaps/new', to: 'keymaps#new'
  get '/keymaps/:id', to: 'keymaps#show'
  post '/keymaps', to: 'keymaps#create'
  get '/keymaps/:id/edit', to: 'keymaps#edit'
  patch '/keymaps/:id', to: 'keymaps#update'
  delete '/keymaps/:id', to: 'keymaps#destroy'
end