# frozen_string_literal: true

module Web
  # Auth Controller
  class AuthController < ApplicationController
    def callback
      if User.find_by(permit_hash).nil?
        User.create(permit_hash)
        redirect_to root_path
      end
    end

    protected

    def permit_hash
      request.env['omniauth.auth'].permit(:info)
    end
  end
end
