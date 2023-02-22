# frozen_string_literal: true

module Web
  module Admin
    # Admin Categories Controller
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.create(permitted_params)
        if @category.save
          flash[:notice] = t('success')
          redirect_to admin_categories_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_categories_path
        end
      end

      def destroy
        @category = Category.find_by(params[:id])
        if @category.delete
          flash[:notice] = t('success')
          redirect_to admin_categories_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_categories_path
        end
      end

      def edit
        @category = Category.find(params[:id])
      end

      def update
        @category = Category.find(params[:id])
        if @category.update(permitted_params)
          flash[:notice] = t('success')
          redirect_to admin_categories_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_categories_path
        end
      end

      protected

      def permitted_params
        params.require(:category).permit(:name)
      end
    end
  end
end
