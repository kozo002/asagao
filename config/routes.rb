Rails.application.routes.draw do
  root to: 'articles#index'
  get :styleguide, to: 'pages#styleguide' unless Rails.env.production?
  get :about, to: 'pages#about'
  get :contact, to: 'pages#contact'

  resources :products, param: :slug, only: [:index, :show]
  resources :articles, param: :slug, only: [:index, :show]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admin do
    root to: 'pages#home'
    resources :articles, param: :slug, only: [:index]
    resources :products, param: :slug do
      resources :articles, param: :slug, module: :products
      resources :images, module: :products do
        put :higher
        put :lower
      end
    end
    resources :images
  end
end
