class EstimatePdfController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @company = @user.company
    @estimate = Estimate.find(params[:id])
    @customer = @estimate.customer
    @contact_person = @estimate.contact_person
    respond_to do |format|
      format.any
      format.pdf do
        estimate_pdf = PracticePdf::EstimatePdf.new(@user, @company, @estimate, @customer, @contact_person).render
        send_data estimate_pdf,
          filename: 'estimate_pdf.#{@estimate.id}.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end
end