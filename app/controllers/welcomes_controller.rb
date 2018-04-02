class WelcomesController < ApplicationController
  before_action :set_template
  
  def index
  end

  private
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
