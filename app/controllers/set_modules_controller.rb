class SetModulesController < ApplicationController
  before_action :logged_in_user

  def edit
  end

  def update
    if params[:set_module] == nil
      flash.now[:danger] = t('select_module')
      render 'edit'
    else
      current_user.update_attributes(
        has_social: params[:set_module][:has_social],
        has_project: params[:set_module][:has_project],
        has_education: params[:set_module][:has_education],
        has_skill: params[:set_module][:has_skill],
        has_experience: params[:set_module][:has_experience],
        has_paper: params[:set_module][:has_paper],
        has_pdf_resume: params[:set_module][:has_pdf_resume]
      )
      flash[:success] = t('update_successfully')
      redirect_to edit_set_module_path(current_user)
    end
  end
end
