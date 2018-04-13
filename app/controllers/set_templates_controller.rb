class SetTemplatesController < ApplicationController
  before_action :logged_in_user

  def edit
  end

  def update
    current_user.update_attributes(user_params)
    flash[:success] = t('update_successfully')
    redirect_to edit_set_template_path(current_user)
  end

  private
    def user_params
      params.require(:set_template).permit(:template)
    end
end
