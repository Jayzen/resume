class PdfOnlinesController < ApplicationController
  before_action :logged_in_user

  def lists
  end

  def set_pdf
    respond_to do |format|
      format.pdf do
        html = render_to_string(tempate: 'pdf_onlines/set_pdf.pdf.erb', layout: 'layouts/application.pdf.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf, filename: 'demo.pdf', type: 'application/pdf', disposition: :inline)
      end
    end 
  end
end
