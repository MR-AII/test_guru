Rails.application.routes.draw do
  root :to => 'tests#index'

  get '/tests/:id/start', to: 'tests#start'

end
