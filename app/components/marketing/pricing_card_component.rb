module Marketing
  class PricingCardComponent < ApplicationComponent
    def initialize(product:, highlighted: false)
      @product = product
      @highlighted = highlighted
    end
  end
end
