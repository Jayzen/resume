class PdfResumesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update, :show, :destroy, :published]
  before_action :find_pdf_resume, only: [:edit, :update, :show, :destroy, :published]

  def new
    @pdf_resume = current_user.pdf_resumes.build
  end

  def create
    @pdf_resume = current_user.pdf_resumes.build(pdf_resume_params)
    if @pdf_resume.save
      flash[:success] = t('upload_successfully')
      redirect_to pdf_resumes_path
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
    if @pdf_resume.update(pdf_resume_params)
      flash[:success] = t('update_successfully')
      redirect_to pdf_resumes_path
    else
      render 'edit'
    end
  end
 
  def destroy
    @pdf_resume.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to pdf_resumes_path
  end

  def index
    @pdf_resumes= current_user.pdf_resumes
  end

  def published
    @pdf_resume.toggle!(:status)
    redirect_to pdf_resumes_path
  end

  def correct_user
    begin
      @pdf_resume = current_user.pdf_resumes.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @pdf_resume = nil
    end
    redirect_to resume_information_path if @pdf_resume.nil?
  end

  private
    def find_pdf_resume
      @pdf_resume = current_user.pdf_resumes.find(params[:id])
    end

    def pdf_resume_params
      params.require(:pdf_resume).permit(:name, :language, :status)
    end
end
