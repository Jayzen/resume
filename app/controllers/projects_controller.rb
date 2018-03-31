class ProjectsController < ApplicationController
  before_action :logged_in_user
  before_action :find_project, only: [:edit, :update, :show, :destroy]

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    flash[:success] = "项目经历更新成功"
    redirect_to project_path(@project)
  end

  def index
    @projects = current_user.projects.order("weight desc")
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.save
    flash[:success] = "项目经历创建成功"
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    flash[:success] = "项目经历删除成功"
    redirect_to projects_path
  end

  private
    def find_project
      @project = current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :tag, :time, :description, :weight)
    end
end
