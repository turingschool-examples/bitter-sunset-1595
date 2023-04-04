Rails.application.routes.draw do
  get  'projects/:id', to: 'projects#show', as: 'project'
  get 'contestants', to: 'contestants#index', as: 'contestants'
  post 'projects/:id/add_contestant', to: 'projects#add_contestant', as: 'add_contestant'
end
