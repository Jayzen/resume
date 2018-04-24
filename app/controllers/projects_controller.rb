class ProjectsController < ApplicationController
  before_action :logged_in_user
  before_action :find_project, only: [:edit, :update, :show, :destroy, :published]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @project.update(project_params)
      flash[:success] = t('update_successfully')
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def index
    @projects = current_user.projects.order("language")
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
     if @project.save
       flash[:success] = t('create_successfully')
       redirect_to projects_path
     else
       render 'new'
     end
  end

  def destroy
    @project.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to projects_path
  end

  def published
    @project.toggle!(:status)
    redirect_to projects_path
  end

  private
    def find_project
      @project = current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:status, :language, :name, :tag, :time, :description, :weight)
    end
end
