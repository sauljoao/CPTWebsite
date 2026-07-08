module Marketing
  class NavbarComponent < ApplicationComponent
    LINKS = [
      [ "Products", :products_path ],
      [ "Pricing", :pricing_path ],
      [ "Portfolio", :portfolio_path ],
      [ "About", :about_path ],
      [ "FAQ", :faq_path ]
    ].freeze
  end
end
