class PagesController < ApplicationController
  def home
    @products = Product.published.limit(4)
    @portfolio_projects = PortfolioProject.featured.limit(3)
    @faqs = Faq.published.limit(4)
  end

  def about
  end
end
