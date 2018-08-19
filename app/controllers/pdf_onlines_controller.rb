class PdfOnlinesController < ApplicationController
  before_action :logged_in_user

  def lists
  end


  def set_pdf
    respond_to do |format|
      format.pdf do
        if params[:template] == "one"
          render :pdf => "my_pdf_name.pdf", :disposition => "inline", :template => "pdf_onlines/one.pdf.erb", :layout => "layouts/application.pdf.erb"
        else params[:template] == "two"
          render :pdf => "my_pdf_name.pdf", :disposition => "inline", :template => "pdf_onlines/two.pdf.erb", :layout => "layouts/application.pdf.erb"
        end
      end
    end 
  end

  def download
    template = nil
    if params[:template] == "one"
      template = "pdf_onlines/one.pdf.erb"
    else
      template = "pdf_onlines/two.pdf.erb"
    end
    html = render_to_string(template: template, layout: "application.pdf.erb") 
    pdf = WickedPdf.new.pdf_from_string(html)
    send_data(pdf, :filename => "my_pdf_name.pdf", :disposition => 'attachment')
  end

end
