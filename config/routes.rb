Rails.application.routes.draw do
  get  'projects/:id', to: 'projects#show', as: 'project'
  get 'contestants', to: 'contestants#index', as: 'contestants'
end
