class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new(request_type: params[:request_type] || "contact")
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.save
      redirect_to contact_path, notice: "Obrigado. Vamos responder no prazo de um dia útil."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :company, :request_type, :message)
  end
end
