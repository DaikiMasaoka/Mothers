Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :troubles do
    resources :answers, only: [:create, :destroy]
  end
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'search' => 'searches#search'
end
