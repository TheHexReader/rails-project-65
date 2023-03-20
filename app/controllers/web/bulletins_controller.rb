# frozen_string_literal: true

module Web
  class BulletinsController < ApplicationController
    before_action :check_if_user_authorized, only: %i[create new edit update destroy]

    def index
      @q = Bulletin.ransack(params[:q])
      @bulletins = @q.result.published.includes(:category).order(created_at: :desc).page params[:page]
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = User.find_by(id: session[:user_id]).bulletins.build(bulletin_params)

      if @bulletin.save
        flash[:notice] = t('success')
        redirect_to root_path
      else
        @bulletin.errors.full_messages.each do |message|
          flash[:notice] = message
        end
        redirect_to new_bulletin_path
      end
    end

    def edit
      @bulletin = User.find_by(id: session[:user_id]).bulletins.find(params[:id])
    end

    def update
      @bulletin = User.find_by(id: session[:user_id]).bulletins.find(params[:id])

      if @bulletin.update(bulletin_params)
        redirect_to @bulletin, notice: t('success')
      else
        @bulletin.errors.full_messages.each do |message|
          flash[:notice] = message
        end
        redirect_to edit_bulletin_path(@bulletin)
      end
    end

    def show
      @bulletin = Bulletin.find_by(id: params[:id])
      
      unless session[:user_id] == @bulletin.user_id || @bulletin.published? || @bulletin.admin?
        redirect_to root_path
        flash[:notice] = t('must_be_authorized')
        return
      end
    end

    def archive
      @bulletin = Bulletin.find_by(id: params[:id]).archive!
      redirect_to profile_path
    end

    def moderate
      @bulletin = Bulletin.find_by(id: params[:id]).moderate!
      redirect_to profile_path
    end

    def search
      index
      render :index
    end

    protected

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id, :image)
    end

    def check_if_user_authorized
      return unless session[:user_id].nil?

      flash[:notice] = t('must_be_authorized')
      redirect_to root_path
    end
  end
end
