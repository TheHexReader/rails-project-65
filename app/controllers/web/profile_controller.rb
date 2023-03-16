# frozen_string_literal: true

module Web
  # Profile controller
  class ProfileController < ApplicationController
    def index
      @user = User.find_by(id: session[:user_id])

      @q = @user.bulletins.ransack(params[:q])
      @bulletins = @q.result.includes(:category).order(created_at: :desc)
    end

    # def search
    #   index
    #   render :index
    # end
  end
end
