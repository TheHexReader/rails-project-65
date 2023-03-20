# frozen_string_literal: true

module Web
  # Profile controller
  class ProfileController < ApplicationController
    def index
      if session[:user_id].nil?
        redirect_to root_path
        flash[:notice] = t('must_be_authorized')
        return
      end

      @user = User.find_by(id: session[:user_id])
      @q = @user.bulletins.ransack(params[:q])
      @bulletins = @q.result.includes(:category).order(created_at: :desc)
    end
  end
end
