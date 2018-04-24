class PapersController < ApplicationController
  before_action :logged_in_user
  before_action :find_paper, only: [:edit, :update, :show, :destroy, :published]

  def show
  end

  def edit
    render action: :new
  end

  def update
    if @paper.update(paper_params)
      flash[:success] = t('update_successfully')
      redirect_to paper_path(@paper)
    else
      render 'edit'
    end
  end

  def index
    @papers = current_user.papers.order("language")
  end

  def new
    @paper = current_user.papers.build
  end

  def create
    @paper = current_user.papers.build(paper_params)
    if @paper.save
      flash[:success] = t('create_successfully')
      redirect_to papers_path
    else
      render 'new'
    end
  end

  def destroy
    @paper.destroy
    flash[:success] = t('destroy_successfully')
    redirect_to papers_path
  end

  def published
    @paper.toggle!(:status)
    redirect_to papers_path
  end
 
  private
    def find_paper
      @paper = current_user.papers.find(params[:id])
    end

    def paper_params
      params.require(:paper).permit(:status, :language, :title, :description, :time,  :weight, :author_ranking, :paper_level)
    end
end
