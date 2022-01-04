Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splash#home', as: :unauthenticated_root
    end
  end
  resources :categories, only: [:index, :new, :create, :show]
  resources :exchanges, only: [:new, :create]
end
