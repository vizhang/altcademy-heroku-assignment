Rails.application.routes.draw do
  root 'homepage#index'

  # Add routes below this line
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  delete '/tasks/:id', to: 'tasks#destroy'
  put '/tasks/:id/mark_complete', to: 'tasks#mark_complete'
  put '/tasks/:id/mark_active', to: 'tasks#mark_active'
  # Add routes below above line

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path'    => 'homepage#index'
end
