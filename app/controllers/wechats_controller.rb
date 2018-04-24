class WechatsController < ApplicationController
  before_action :logged_in_user
  before_action :find_wechat, only: [:edit, :update, :show, :destroy, :published]
  
  def new
    @wechat = current_user.build_wechat
  end

  def create
    @wechat = current_user.build_wechat(wechat_params)
    if @wechat.save
      flash[:success] = t('upload_successfully')
      redirect_to socials_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @wechat.update_attributes(wechat_params)
      flash[:success] = t('update_successfully')
      redirect_to socials_path
    else
      render 'new'
    end
  end
 
  def destroy
    current_user.wechat.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to socials_path
  end

  def published
    @wechat.toggle!(:status)
    redirect_to socials_path
  end

  private
    def find_wechat
      @wechat = current_user.wechat
    end

    def wechat_params
      params.require(:wechat).permit(:name, :status)
    end
end
