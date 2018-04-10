class SocialsController < ApplicationController
  before_action :logged_in_user
  before_action :find_social, only: [:edit, :update, :show, :destroy]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @social.update(social_params)
      flash[:success] = "社交信息更新成功"
      redirect_to social_path(@social)
    else
      render 'edit'
    end
  end

  def index
    @socials = current_user.socials.order("weight desc")
  end

  def new
    @social = current_user.socials.build
  end

  def create
    @social = current_user.socials.build(social_params)
    if @social.save
      flash[:success] = "社交信息创建成功"
      redirect_to socials_path
    else
      render 'new'
    end
  end

  def destroy
    @social.destroy
    flash[:success] = "社交信息删除成功"
    redirect_to socials_path
  end

  private
    def find_social
      @social = current_user.socials.find(params[:id])
    end

    def social_params
      params.require(:social).permit(:name, :weight, :url)
    end
end
