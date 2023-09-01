Rails.application.routes.draw do
  devise_for :users 
  resources :pics do
    member do
      put 'like', to: "pics#upvote" # For updating the like (PUT request)
      get 'like', to: "pics#upvote" # For displaying the like (GET request)
    end
  end

  resources :pics do
    resources :comments, only: [:create]
  end  

  root "pics#index"
end
