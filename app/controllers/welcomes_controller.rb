class WelcomesController < ApplicationController
  def index
    render layout: "home"
  end

  def show
    if @user = User.find_by(name_en: params[:name_en])
      @wechat = @user.wechat if @user.wechat
      @template = @user.template
      @socials = @user.socials.where(status: true).order("weight desc")
      if params[:locale] == "zh"
        @pdf_resumes = @user.pdf_resumes.zh
        @projects = @user.projects.zh_order
        @educations = @user.educations.zh_order
        @skills = @user.skills.zh_order
        @experiences = @user.experiences.zh_order
        @papers = @user.papers.zh_order
      elsif params[:locale] == "en"
        @pdf_resumes = @user.pdf_resumes.en
        @projects = @user.projects.en_order
        @educations = @user.educations.en_order
        @skills = @user.skills.en_order
        @experiences = @user.experiences.en_order
        @papers = @user.papers.en_order
      end
      if params[:locale].nil?
        render layout: 'home'
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

  def introduction_zh
    render layout: "home"
  end

  def introduction_en
    render layout: "home"
  end
end
