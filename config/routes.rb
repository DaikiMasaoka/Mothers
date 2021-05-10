Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :troubles do
    resources :answers
  end
  resources :diarys do
    resources :diary_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users

end
