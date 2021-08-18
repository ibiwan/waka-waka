  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      
      resources :articles, only: [:index, :show, :create, :update] do
        resources :sections, only: [:show, :create, :update] do
          resources :paragraphs, only: [:show, :create] do
          end
        end
      end

      resources :users, only: [:show, :create, :update]
      
      resources :edits, only: [:index, :show]
    end
  end
end
