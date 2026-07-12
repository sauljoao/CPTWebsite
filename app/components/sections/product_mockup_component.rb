module Sections
  class ProductMockupComponent < ApplicationComponent
    PRODUCT_KINDS = {
      "página de aterragem" => :landing,
      "website" => :website,
      "loja online" => :ecommerce,
      "solução à medida" => :custom
    }.freeze

    def initialize(product: nil, kind: nil)
      @product = product
      @kind = kind || PRODUCT_KINDS.fetch(product&.name.to_s.downcase, :dashboard)
    end

    def product_name
      @product&.name || "Sistema de construção CPT"
    end

    def mockup_actions
      case @kind
      when :landing
        [ [ "Hero", "hero" ], [ "Prova", "proof" ], [ "CTA", "cta" ] ]
      when :website
        [ [ "Home", "home" ], [ "Serviços", "services" ], [ "Sobre", "about" ] ]
      when :ecommerce
        [ [ "Loja", "shop" ], [ "Produto", "product" ], [ "Carrinho", "cart" ] ]
      when :custom
        [ [ "Dashboard", "dashboard" ], [ "Workflow", "workflow" ], [ "Relatório", "report" ] ]
      else
        [ [ "Plano", "plan" ], [ "Design", "design" ], [ "Lançamento", "launch" ] ]
      end
    end

    attr_reader :kind
  end
end
