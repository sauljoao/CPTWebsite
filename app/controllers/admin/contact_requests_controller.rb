module Admin
  class ContactRequestsController < BaseController
    before_action :set_contact_request, only: [ :show, :update ]

    def index
      @contact_requests = ContactRequest.order(created_at: :desc)
    end

    def show
    end

    def update
      if @contact_request.update(contact_request_params)
        redirect_to admin_contact_request_path(@contact_request), notice: "Contact request updated."
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    def contact_request_params
      params.require(:contact_request).permit(:status)
    end
  end
end
