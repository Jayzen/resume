class WelcomesController < ApplicationController
  before_action :get_variables
  before_action :set_template
  
  def index
  end

  private
    def get_variables
      @socials = Social.order("weight desc")
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
        render layout: "template_two"
      end
    end
end
