module Web
  class BulletinsController < ApplicationController
    def new
      @bulletin = Bulletin.new
    end

    def create
      if Bulletin.create(params[:bulletin])
        flash[:notice] = t('success')
        redirect_to bulletins_path
      else
        flash[:notice] = t('fail')
        redirect_to root_path
      end
    end

    def show
      @bulletin = Bulletin.find_by(id: params[:id])
    end
  end
end
