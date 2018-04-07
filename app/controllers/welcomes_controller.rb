class WelcomesController < ApplicationController
  before_action :get_variables
  before_action :set_template
  
  def index
  end

  private
    def get_variables
      @socials = Social.order("weight desc")
      @projects = Project.order("weight desc")
      @educations = Education.order("weight desc")
      @skills = Skill.order("weight desc")
      @experiences = Experience.order("weight desc")
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
