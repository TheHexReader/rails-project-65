# frozen_string_literal: true

module Web
  # Profile controller
  class ProfileController < ApplicationController
    def index
      @user = User.find_by(id: session[:user_id])
    end
  end
end
