class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :set_locale

  protected
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale 
    end
end
