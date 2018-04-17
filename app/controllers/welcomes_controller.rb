class WelcomesController < ApplicationController
  def index
    render layout: "unlogin"
  end

  def show
    if @user = User.find_by(name_en: params[:name_en])
      @socials = @user.socials.order("weight desc")
      @projects = @user.projects.order("weight desc")
      @educations = @user.educations.order("weight desc")
      @skills = @user.skills.order("weight desc")
      @experiences = @user.experiences.order("weight desc")
      @pdf_resume = @user.pdf_resume 
      @wechat = @user.wechat
      @template = @user.template
      if params[:locale].nil?
        render layout: 'unlogin'
      else
        case @template
        when 1
          render layout: "template_one"
        when 2
          render layout: "template_two"
        end
      end
    else
      redirect_to root_path
    end
  end

  def set_zh
    I18n.locale = cookies[:locale] = :zh
    redirect_to request.referer
  end

  def set_en
    I18n.locale = cookies[:locale] = :en
    redirect_to request.referer
  end
end
