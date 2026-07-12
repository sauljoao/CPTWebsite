module Pages
  class HomeComponent < ApplicationComponent
    def initialize(products:, portfolio_projects:, faqs:)
      @products = products
      @portfolio_projects = portfolio_projects
      @faqs = faqs
    end
  end
end
