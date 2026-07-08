module Marketing
  class ProductMockupComponent < ApplicationComponent
    PRODUCT_KINDS = {
      "landing page" => :landing,
      "website" => :website,
      "ecommerce website" => :ecommerce,
      "custom solution" => :custom
    }.freeze

    def initialize(product: nil, kind: nil)
      @product = product
      @kind = kind || PRODUCT_KINDS.fetch(product&.name.to_s.downcase, :dashboard)
    end

    def product_name
      @product&.name || "CPT build system"
    end

    def mockup_actions
      case @kind
      when :landing
        [ [ "Hero", "hero" ], [ "Proof", "proof" ], [ "CTA", "cta" ] ]
      when :website
        [ [ "Home", "home" ], [ "Services", "services" ], [ "About", "about" ] ]
      when :ecommerce
        [ [ "Shop", "shop" ], [ "Product", "product" ], [ "Cart", "cart" ] ]
      when :custom
        [ [ "Dashboard", "dashboard" ], [ "Workflow", "workflow" ], [ "Report", "report" ] ]
      else
        [ [ "Plan", "plan" ], [ "Design", "design" ], [ "Launch", "launch" ] ]
      end
    end

    attr_reader :kind
  end
end
