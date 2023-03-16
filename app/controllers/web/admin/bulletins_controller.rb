# frozen_string_literal: true

module Web
  module Admin
    # Admin Bulletins Controller
    class BulletinsController < ApplicationController
      def index
        @q = Bulletin.ransack(params[:q])
        @bulletins = @q.result.includes(:category).order(created_at: :desc)
      end

      def new
        @bulletin = Bulletin.new
      end

      def create
        @bulletin = Bulletin.create(permitted_params)
        flash[:notice] = if @bulletin.save
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_bulletin_path
      end

      def destroy
        @bulletin = Bulletin.find_by(params[:id])
        flash[:notice] = if @bulletin.delete
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_bulletins_path
      end

      def edit
        @bulletin = Bulletin.find(params[:id])
      end

      def update
        @bulletin = Bulletin.find(params[:id])
        flash[:notice] = if @bulletin.update(permitted_params)
                           t('success')
                         else
                           t('failure')
                         end
        redirect_to admin_bulletin_path
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

      def search
        index
        render :index
      end

      protected

      def permitted_params
        params.require(:bulletin).permit(:name)
      end
    end
  end
end
