Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :troubles do
    resources :answers, only: [:create, :destroy]
  end
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'search' => 'searches#search'
end
