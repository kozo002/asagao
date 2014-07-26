Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admin do
    root to: 'pages#home'

    resources :articles, param: :slug, only: [:index]

    resources :products, param: :slug do
      resources :articles, param: :slug, module: :products
    end

    resources :images
  end
end
