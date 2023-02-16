module Web
  class BulletinsController < ApplicationController
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

    protected

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id)
    end
  end
end
