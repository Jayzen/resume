class WechatsController < ApplicationController
  before_action :logged_in_user

  def new
    @wechat = current_user.build_wechat
  end

  def create
    if params[:wechat].nil? 
      @wechat = current_user.build_wechat
      @wechat.errors.add(:name, t('must_upload'))
      render 'new'
    elsif
      @wechat = current_user.build_wechat(wechat_params)
      @wechat.save
      flash[:success] = t('upload_successfully')
      redirect_to socials_path
    else
      flash[:danger] = "只能上传照片格式的文件!"
      redirect_to socials_path
    end
  end

  def show
    @wechat = current_user.wechat
  end

  def edit
    @wechat = current_user.wechat
    render action: :new
  end

  def update
    if params[:wechat].nil?
      @wechat = current_user.build_wechat
      @wechat.errors.add(:name, t('must_upload'))
      render 'new'
    elsif
      @wechat = current_user.wechat.update_attributes(wechat_params)
      flash[:success] = t('update_successfully')
      redirect_to socials_path
    else
      flash[:danger] = "只能上传照片格式的文件!"
      redirect_to socials_path
    end
  end
 
  def destroy
    current_user.wechat.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to socials_path
  end

  private
    def wechat_params
      params.require(:wechat).permit(:name)
    end
end
