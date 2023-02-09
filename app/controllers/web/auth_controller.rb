# frozen_string_literal: true

module Web
  # Auth Controller
  class AuthController < ApplicationController
    def callback
      info = request.env['omniauth.auth'][:info]

      user = User.find_by(email: info[:email], name: info[:name])

      user = User.create(email: info[:email], name: info[:name]) if user.nil?

      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end
