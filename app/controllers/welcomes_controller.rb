class WelcomesController < ApplicationController
  before_action :logged_in_user, only: [:set_language]
  
  def index
    if logged_in?
      @socials = current_user.socials.order("weight desc")
      @projects = current_user.projects.order("weight desc")
      @educations = current_user.educations.order("weight desc")
      @skills = current_user.skills.order("weight desc")
      @experiences = current_user.experiences.order("weight desc")
      @pdf_resume = current_user.pdf_resume
      @wechat = current_user.wechat
      @template = current_user.template
      case @template
      when 1
        render layout: "template_one"
      when 2
        render layout: "template_two"
      end
    else
      render layout: "unlogin"
    end
  end

  def show
    if @user = User.find_by(name: params[:user_name])
      @socials = @user.socials.order("weight desc")
      @projects = @user.projects.order("weight desc")
      @educations = @user.educations.order("weight desc")
      @skills = @user.skills.order("weight desc")
      @experiences = @user.experiences.order("weight desc")
      @pdf_resume = @user.pdf_resume 
      @wechat = @user.wechat
      @template = @user.template
      case @template
      when 1
        render layout: "template_one"
      when 2
        render layout: "template_two"
      end
    else
      redirect_to root_path
    end
  end

  def set_zh
    cookies[:locale] = :zh
    if logged_in?
      redirect_to set_language_path
    else
      redirect_to root_path
    end
  end

  def set_en
    cookies[:locale] = :en
    if logged_in?
      redirect_to set_language_path
    else
      redirect_to root_path
    end
  end

  def set_language
  end
end
