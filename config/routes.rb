Rails.application.routes.draw do
    get '/movies', to: 'movies#index'
    get '/sheets', to: 'sheets#index'

    namespace :admin do
        resources :movies, only: [:index, :new, :create, :show, :edit, :update]
    end

    namespace :admin do
        resources :movies do
          member do
            delete :destroy
          end
        end
      end

      
end
  