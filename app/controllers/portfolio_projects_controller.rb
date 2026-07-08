class PortfolioProjectsController < ApplicationController
  def index
    @portfolio_projects = PortfolioProject.published
  end

  def show
    @portfolio_project = PortfolioProject.published.friendly.find(params[:id])
  end
end
