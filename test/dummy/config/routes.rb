Rails.application.routes.draw do
  root to: 'home#index'
  get '/options', to: 'home#options'
end

