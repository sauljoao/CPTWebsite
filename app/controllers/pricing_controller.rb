class PricingController < ApplicationController
  def index
    @products = Product.published
  end
end
