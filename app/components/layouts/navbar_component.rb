module Layouts
  class NavbarComponent < ApplicationComponent
    LINKS = [
      [ "Produtos", :products_path ],
      [ "Preços", :pricing_path ],
      [ "Portefólio", :portfolio_path ],
      [ "Sobre", :about_path ],
      [ "FAQ", :faq_path ]
    ].freeze
  end
end
