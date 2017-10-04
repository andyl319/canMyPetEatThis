Rails.application.routes.draw do
  root 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy, :show]
    resources :pets, only: [:create, :destroy, :show, :index, :update] do
      resources :food, only: [:create, :destroy, :show, :index, :update] do
        member do
          post "upvote"
          post "downvote"
        end
        resources :comments, only: [:create, :update, :index, :destroy]
      end
      resources :thread, only: [:create, :update, :show, :index, :destroy] do
        resources :comments, only: [:create, :update, :index, :destroy]
      end
    end
  end
end
