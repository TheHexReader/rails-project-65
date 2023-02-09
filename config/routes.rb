# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/home#index'

  post 'auth/:provider', to: 'web/auth#request', as: :auth_request
  get 'auth/:provider/callback', to: 'web/auth#callback', as: :callback_auth
end
