Rails.application.routes.draw do
 
  devise_for :users, controllers: {sessions: 'user/sessions'}
  
  root to: 'tests#index'
  

    resources :tests, only: :index do
        member do
          post :start
        end
    end

    # GET /test_passages/101/result
   resources :test_passages, only: %i[show update] do
      # используем member т.к. метод result относится не к коллекции,
      # а к конкретному ресурсу
      member do
        get :result 
      end
   end

<<<<<<< HEAD
    namespace :admin do
     resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index 
        end
      end
    end
end
=======
   namespace :admin do
      resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index 
        end
        member do
          post :start
        end
      end
    end
end
>>>>>>> 67939b91a2eed1f352920c9b71b45dea3d3da2ed
