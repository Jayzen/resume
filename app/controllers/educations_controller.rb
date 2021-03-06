class EducationsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update, :show, :destroy, :published]
  before_action :find_education, only: [:edit, :update, :show, :destroy, :published]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @education.update(education_params)
      flash[:success] = t('upload_successfully')
      redirect_to education_path(@education)
    else
      render 'edit'
    end
  end

  def index
    @educations = current_user.educations.order("language")
  end

  def new
    @education = current_user.educations.build
  end

  def create
    @education = current_user.educations.build(education_params)
    if @education.save
      flash[:success] = t('create_successfully')
      redirect_to educations_path
    else
      render 'new'
    end
  end

  def destroy
    @education.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to educations_path
  end

  def published
    @education.toggle!(:status)
    redirect_to educations_path
  end

  def correct_user
    begin
      @education = current_user.educations.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @education = nil
    end
    redirect_to resume_information_path if @education.nil?
  end

  private
    def find_education
      @education = current_user.educations.find(params[:id])
    end

    def education_params
      params.require(:education).permit(:language, :school, :degree, :major, :gpa, :time,  :weight)
    end
end
