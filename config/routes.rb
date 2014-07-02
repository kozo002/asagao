Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admin do
    root to: 'pages#home'

    resource :products, param: :slug
  end
end
