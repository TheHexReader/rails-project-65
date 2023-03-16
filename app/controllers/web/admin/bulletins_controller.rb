# frozen_string_literal: true

module Web
  module Admin
    # Admin Bulletins Controller
    class BulletinsController < ApplicationController
      def index
        @bulletins = Bulletin.all.order(created_at: :desc)
      end

      def new
        @bulletin = Bulletin.new
      end

      def create
        @bulletin = Bulletin.create(permitted_params)
        if @bulletin.save
          flash[:notice] = t('success')
          redirect_to admin_bulletin_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_bulletin_path
        end
      end

      def destroy
        @bulletin = Bulletin.find_by(params[:id])
        if @bulletin.delete
          flash[:notice] = t('success')
          redirect_to admin_bulletins_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_bulletins_path
        end
      end

      def edit
        @bulletin = Bulletin.find(params[:id])
      end

      def update
        @bulletin = Bulletin.find(params[:id])
        if @bulletin.update(permitted_params)
          flash[:notice] = t('success')
          redirect_to admin_bulletin_path
        else
          flash[:notice] = t('failure')
          redirect_to admin_bulletin_path
        end
      end

      def archive
        @bulletin = Bulletin.find_by(id: params[:bulletin_id]).archive!
        redirect_to admin_bulletins_path
      end

      def moderate
        @bulletin = Bulletin.find_by(id: params[:bulletin_id]).moderate!
        redirect_to admin_bulletins_path
      end

      def publish
        @bulletin = Bulletin.find_by(id: params[:bulletin_id]).publish!
        redirect_to admin_bulletins_path
      end

      def reject
        @bulletin = Bulletin.find_by(id: params[:bulletin_id]).reject!
        redirect_to admin_bulletins_path
      end

      protected

      def permitted_params
        params.require(:bulletin).permit(:name)
      end
    end
  end
end
