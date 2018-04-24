class ExperiencesController < ApplicationController
  before_action :logged_in_user
  before_action :find_experience, only: [:edit, :update, :show, :destroy, :published]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @experience.update(experience_params)
      flash[:success] = t('update_successfully')
      redirect_to experience_path(@experience)
    else
      render 'edit'
    end
  end

  def index
    @experiences = current_user.experiences.order("language")
  end

  def new
    @experience = current_user.experiences.build
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      flash[:success] = t('create_successfully')
      redirect_to experiences_path
    else
      render 'new'
    end
  end

  def destroy
    @experience.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to experiences_path
  end
  
  def published
    @experience.toggle!(:status)
    redirect_to experiences_path
  end

  private
    def find_experience
      @experience = current_user.experiences.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:language, :company, :position, :description, :time,  :weight)
    end
end
