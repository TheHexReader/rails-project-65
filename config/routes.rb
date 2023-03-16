# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/bulletins#index'

  post 'auth/:provider', to: 'web/auth#request', as: :auth_request
  get 'auth/:provider/callback', to: 'web/auth#callback', as: :callback_auth

  delete 'auth/sign_out', to: 'web/auth#destroy', as: :sign_out

  scope module: :web do
    resources :bulletins, only: %i[show new create edit update delete index] do
      member do
        patch :archive
        patch :moderate
      end
    end

    scope :admin, module: :admin, as: :admin do
      resources :categories, :users

      resources :bulletins do
        member do
          patch :publish
          patch :archive
          patch :reject
          patch :moderate
        end
      end

    end
  end

  get 'profile', to: 'web/profile#index', as: :profile
end
