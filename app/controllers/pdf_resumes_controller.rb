class PdfResumesController < ApplicationController
  before_action :logged_in_user

  def new
    @pdf_resume = current_user.build_pdf_resume
  end

  def create
    if params[:pdf_resume].nil? 
      @pdf_resume = current_user.build_pdf_resume
      @pdf_resume.errors.add(:name, t('must_upload'))
      render 'new'
    elsif
      @pdf_resume = current_user.build_pdf_resume(pdf_resume_params)
      @pdf_resume.save
      flash[:success] = t('upload_successfully')
      redirect_to pdf_resumes_path
    else
      flash[:danger] = "只能上传PDF格式的文件!"
      redirect_to pdf_resumes_path
    end
  end

  def show
    @pdf_resume = current_user.pdf_resume
  end

  def edit
    @pdf_resume = current_user.pdf_resume
    render action: :new
  end

  def update
    if params[:pdf_resume].nil?
      @pdf_resume = current_user.build_pdf_resume
      @pdf_resume.errors.add(:name, t('must_upload'))
      render 'new'
    elsif
      @pdf_resume = current_user.pdf_resume.update_attributes(pdf_resume_params)
      flash[:success] = t('update_successfully')
      redirect_to pdf_resumes_path
    else
      flash[:danger] = "只能上传PDF格式的文件!"
      redirect_to pdf_resumes_path
    end
  end
 
  def destroy
    current_user.pdf_resume.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to pdf_resumes_path
  end

  def index
    if current_user.pdf_resume
      @pdf_resume = current_user.pdf_resume
    else
      @pdf_resume = current_user.build_pdf_resume
    end
  end
  
  private
    def pdf_resume_params
      params.require(:pdf_resume).permit(:name)
    end
end
