Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/projects/:id', to: 'projects#show'
  get '/contestants/index', to: 'contestants#index'
end
