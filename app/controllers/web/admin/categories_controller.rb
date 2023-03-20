# frozen_string_literal: true

module Web
  module Admin
    # Admin Categories Controller
    class CategoriesController < ApplicationController
      before_action :check_if_user_authorized

      def index
        @categories = Category.all
      end

      def show
        @category = Category.find(params[:id])
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.create(permitted_params)
        flash[:notice] = if @category.save
                           t('success')
                         else
                           t('fail')
                         end
        redirect_to admin_categories_path
      end

      def destroy
        p '--------------------'
        p params[:id]
        @category = Category.find_by(params[:id])
        flash[:notice] = if @category.delete
                           t('success')
                         else
                           t('fail')
                         end
        redirect_to admin_categories_path
      end

      def edit
        @category = Category.find(params[:id])
      end

      def update
        @category = Category.find(params[:id])
        flash[:notice] = if @category.update(permitted_params)
                           t('success')
                         else
                           t('fail')
                         end
        redirect_to admin_categories_path
      end

      protected

      def permitted_params
        params.require(:category).permit(:name)
      end

      def check_if_user_authorized
        unless User.find_by(id: session[:user_id]).admin?
          flash[:notice] = t('must_be_authorized')
          redirect_to root_path
          return
        end
      end
    end
  end
end
