# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/home#index'

  post 'auth/:provider', to: 'web/auth#request', as: :auth_request
  get 'auth/:provider/callback', to: 'web/auth#callback', as: :callback_auth

  delete 'auth/sign_out', to: 'web/auth#destroy', as: :sign_out

  scope module: :web do
    resources 'bulletin', only: %i[show new create delete]
  end

  get 'profile', to: 'web/profile#index', as: :profile
end
