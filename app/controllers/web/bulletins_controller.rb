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

      flash[:notice] = if @bulletin.save
                         t('success')
                       else
                         t('fail')
                       end
      redirect_to root_path
    end

    def edit
      @bulletin = User.find_by(id: session[:user_id]).bulletins.find(params[:id], state: :draft)
    end

    def update
      @bulletin = User.find_by(id: session[:user_id]).bulletins.find(params[:id], state: :draft)

      if @bulletin.update(bulletin_params)
        redirect_to @bulletin, notice: t('success')
      else
        render :edit
        flash[:notice] = t('failure')
      end
    end

    def show
      @bulletin = Bulletin.find_by(id: params[:id])
    end

    def archive
      @bulletin = Bulletin.find_by(id: params[:bulletin_id]).archive!
      redirect_to profile_path
    end

    def moderate
      @bulletin = Bulletin.find_by(id: params[:bulletin_id]).moderate!
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
