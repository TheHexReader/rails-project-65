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
        flash[:notice] = if @user.save
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_user_path
      end

      def destroy
        @user = User.find_by(params[:id])
        flash[:notice] = if @user.delete
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_user_path
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        flash[:notice] = if @user.update(permitted_params)
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_user_path
      end

      protected

      def permitted_params
        params.require(:user).permit(:email)
      end
    end
  end
end
