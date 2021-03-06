class SocialsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update, :show, :destroy, :published]
  before_action :find_social, only: [:edit, :update, :show, :destroy, :published]
  
  def show
  end

  def edit
    render action: :new
  end

  def update
    if @social.update(social_params)
      flash[:success] = t('update_successfully')
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
      flash[:success] = t('create_successfully')
      redirect_to socials_path
    else
      render 'new'
    end
  end

  def destroy
    @social.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to socials_path
  end

  def published
    @social.toggle!(:status)
    redirect_to socials_path
  end

  def correct_user
    begin
      @social = current_user.socials.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @social = nil
    end
    redirect_to resume_information_path if @social.nil?
  end 
  
  private
    def find_social
      @social = current_user.socials.find(params[:id])
    end

    def social_params
      params.require(:social).permit(:name, :weight, :url)
    end
end
