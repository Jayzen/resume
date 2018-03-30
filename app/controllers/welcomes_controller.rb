class WelcomesController < ApplicationController
  before_action :set_template
  
  def index
  end

  private
    def set_template
      @template = User.first.template
      case @template
      when 1
        render layout: "template_one"
      when 2
        render layout: "template_two"
      end
    end
end
