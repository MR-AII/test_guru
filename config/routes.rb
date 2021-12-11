Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:category/:title', to: 'tests#search'

  # resource :account, controller: :account
  #
  # resources :tests, only: %i[index show]
  #
  # resources :tests do
  #   resources :questions
  # end

  # GET /tests/beginner
  # POST /tests/1/start

  # resources :tests do
  #   get :beginner, on: :collection
  #   get :begin, on: :member
  #
  #   member do
  #     get :start
  #   end
  # end

  # get '/tests', to: 'tests#index'

  #g et 'tests/:id', to: 'tests#show', as: :test

  # get 'tests(/:id)', to: 'tests#show'

  # get '/tests/:id/start', to: 'tests#start'

  #  get 'tests/:id/start', to: 'tasks#/start'

  # match 'tests/:id', to: 'tests#create', via: %i[post put]

  # # match 'tests/:id', to: 'tests#create', via: :all

end
