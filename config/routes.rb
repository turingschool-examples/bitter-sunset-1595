Rails.application.routes.draw do
  get '/projects/:id', to: 'projects#show'

  get '/contestants', to: 'contestants#index'
  
  post '/contestant_projects', to: "contestant_projects#create"
end
