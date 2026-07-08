class QuoteCalculator
  COMPLEXITY_MULTIPLIERS = {
    "simple" => 1.0,
    "standard" => 1.25,
    "advanced" => 1.6
  }.freeze

  ADD_ONS = {
    "copywriting" => 500,
    "brand_refresh" => 900,
    "cms_setup" => 700,
    "analytics" => 300,
    "priority_delivery" => 800
  }.freeze

  def initialize(product:, pages: 5, complexity: "standard", add_ons: [])
    @product = product
    @pages = pages.to_i.clamp(1, 40)
    @complexity = complexity.presence_in(COMPLEXITY_MULTIPLIERS.keys) || "standard"
    @add_ons = Array(add_ons).filter_map { |add_on| add_on.presence_in(ADD_ONS.keys) }
  end

  def estimate_cents
    (((base_price + page_cost + add_on_cost) * complexity_multiplier) * 100).round
  end

  def estimate
    estimate_cents / 100
  end

  def configuration
    {
      pages: @pages,
      complexity: @complexity,
      add_ons: @add_ons
    }
  end

  private

  def base_price
    @product&.price || 2500
  end

  def page_cost
    [ @pages - 5, 0 ].max * 180
  end

  def add_on_cost
    @add_ons.sum { |add_on| ADD_ONS.fetch(add_on) }
  end

  def complexity_multiplier
    COMPLEXITY_MULTIPLIERS.fetch(@complexity)
  end
end
