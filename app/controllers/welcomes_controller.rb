class WelcomesController < ApplicationController
  before_action :get_variables
  before_action :set_template
  
  def index
  end

  private
    def get_variables
      if logged_in?
        @socials = current_user.socials.order("weight desc")
        @projects = current_user.projects.order("weight desc")
        @educations = current_user.educations.order("weight desc")
        @skills = current_user.skills.order("weight desc")
        @experiences = current_user.experiences.order("weight desc")
        @pdf_resume = current_user.pdf_resume
      end
    end

    def set_template
      if logged_in?
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
end
