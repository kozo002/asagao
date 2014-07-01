Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins

  namespace :admin do
    root to: 'pages#home'
  end
end
