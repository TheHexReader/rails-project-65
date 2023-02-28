# frozen_string_literal: true

module Web
  module Admin
    # Admin Bulletins Controller
    class UsersController < ApplicationController
      def index
        @users = User.all
      end

      def new
        @user = User.new
      end

      def create
        @user = User.create(permitted_params)
        if @user.save
          flash[:notice] = t('success')
          redirect_to admin_user_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_user_path
        end
      end

      def destroy
        @user = User.find_by(params[:id])
        if @user.delete
          flash[:notice] = t('success')
          redirect_to admin_user_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_user_path
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(permitted_params)
          flash[:notice] = t('success')
          redirect_to admin_user_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_user_path
        end
      end

      protected

      def permitted_params
        params.require(:user).permit(:email)
      end
    end
  end
end
