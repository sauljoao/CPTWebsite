module Admin
  class QuoteRequestsController < BaseController
    before_action :set_quote_request, only: [ :show, :update ]

    def index
      @quote_requests = QuoteRequest.includes(:product).order(created_at: :desc)
    end

    def show
    end

    def update
      if @quote_request.update(quote_request_params)
        redirect_to admin_quote_request_path(@quote_request), notice: "Quote request updated."
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_quote_request
      @quote_request = QuoteRequest.find(params[:id])
    end

    def quote_request_params
      params.require(:quote_request).permit(:status)
    end
  end
end
