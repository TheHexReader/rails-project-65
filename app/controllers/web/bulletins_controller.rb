module Web
  class BulletinsController < ApplicationController
    before_action :check_if_user_authorized, only: %i[create new edit update destroy]

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = User.find_by(id: session[:user_id]).bulletins.build(bulletin_params)

      if @bulletin.save
        flash[:notice] = t('success')
        redirect_to root_path
      else
        flash[:notice] = t('fail')
        redirect_to root_path
      end
    end

    def show
      @bulletin = Bulletin.find_by(id: params[:id])
    end

    def archive
      @bulletin = Bulletin.find_by(id: params[:id]).archive!
      redirect_to profile_path
    end

    def moderate
      @bulletin = Bulletin.find_by(id: params[:id]).moderate!
      redirect_to profile_path
    end

    protected

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id, :image)
    end

    def check_if_user_authorized
      if session[:user_id].nil?
        flash[:notice] = t('must_be_authorized')
        redirect_to root_path
      end
    end
  end
end