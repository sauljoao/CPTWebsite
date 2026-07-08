class QuoteRequestsController < ApplicationController
  def new
    @products = Product.published
    @quote_request = QuoteRequest.new(product_id: params[:product_id])
  end

  def create
    @products = Product.published
    request_params = quote_request_params
    @quote_request = QuoteRequest.new(request_params.except(:pages, :complexity, :add_ons))
    calculator = QuoteCalculator.new(
      product: @quote_request.product,
      pages: request_params[:pages],
      complexity: request_params[:complexity],
      add_ons: request_params[:add_ons]
    )
    @quote_request.configuration = calculator.configuration
    @quote_request.estimated_price_cents = calculator.estimate_cents

    if @quote_request.save
      redirect_to new_quote_request_path, notice: "Your estimate is #{helpers.number_to_currency(calculator.estimate, precision: 0)}. We will follow up with a precise proposal."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quote_request_params
    params.require(:quote_request).permit(:product_id, :name, :email, :company, :message, :pages, :complexity, add_ons: [])
  end
end
