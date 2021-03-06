Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        mount ActionCable.server => '/cable'
        resources :users, only: :create do
          collection do
            post 'confirm'
            post 'login'
          end
        end

        get 'users/:id', to: 'users#show'

        post 'users/current', to: 'users#find_current_user'

        post 'password/forgot', to: 'password#forgot'

        post 'password/reset', to: 'password#reset'

        put 'password/update', to: 'password#update'

        # get 'home' => 'home#index'
        resources :votes, only: [:create, :destroy]

        get 'categories' => 'categories#index'

        get 'tags' => 'tags#index'

        post 'users' => 'users#create'

        resources :questions, only: [:index, :create, :show, :destroy]

        resources :answers, only: [:create, :destroy]


      end
    end

end
