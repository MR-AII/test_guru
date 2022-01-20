Rails.application.routes.draw do

  get 'gists/index'
  get 'admin/gists/fill'
  # delete 'admin/gists/delete_all'
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }


  resources :tests, only: :index do
    # except: :index  исключение экшенов
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result

      # опять post как get посылает
      get :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: %i[index destroy destroy_all] do
      member do
        get :destroy
        get :delete_all
      end
    end
  end

  get '/tests/:category/:title', to: 'tests#search'
end
