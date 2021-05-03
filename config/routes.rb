Rails.application.routes.draw do
  get 'troubles/index'
  get 'troubles/show'
  get 'troubles/edit'
  get 'diarys/index'
  get 'diarys/show'
  get 'diarys/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
end
