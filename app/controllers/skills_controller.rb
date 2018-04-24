class SkillsController < ApplicationController
  before_action :logged_in_user
  before_action :find_skill, only: [:edit, :update, :show, :destroy, :published]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @skill.update(skill_params)
      flash[:success] = t('update_successfully')
      redirect_to skill_path(@skill)
    else
      render 'edit'
    end
  end

  def index
    @skills = current_user.skills.order("language")
  end

  def new
    @skill = current_user.skills.build
  end

  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = t('create_successfully')
      redirect_to skills_path
    else
      render 'new'
    end
  end

  def destroy
    @skill.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to skills_path
  end

  def published
    @skill.toggle!(:status)
    redirect_to skills_path
  end

  private
    def find_skill
      @skill = current_user.skills.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:language, :name, :weight, :description)
    end
end
