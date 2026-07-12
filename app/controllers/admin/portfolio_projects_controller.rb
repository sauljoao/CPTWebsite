module Admin
  class PortfolioProjectsController < BaseController
    before_action :set_portfolio_project, only: [ :show, :edit, :update, :destroy ]

    def index
      @portfolio_projects = PortfolioProject.order(:position, :title)
    end

    def show
    end

    def new
      @portfolio_project = PortfolioProject.new
    end

    def edit
    end

    def create
      @portfolio_project = PortfolioProject.new(portfolio_project_params)

      if @portfolio_project.save
        redirect_to admin_portfolio_project_path(@portfolio_project), notice: "Project created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @portfolio_project.update(portfolio_project_params)
        redirect_to admin_portfolio_project_path(@portfolio_project), notice: "Project updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @portfolio_project.destroy
      redirect_to admin_portfolio_projects_path, notice: "Project deleted."
    end

    private

    def set_portfolio_project
      @portfolio_project = PortfolioProject.friendly.find(params[:id])
    end

    def portfolio_project_params
      permitted = params.require(:portfolio_project).permit(:title, :product_type, :industry, :summary, :outcome, :position, :featured, :published, services_text: [])
      permitted[:services] = Array(params.dig(:portfolio_project, :services_text)).flat_map { |item| item.to_s.split("\n") }.map(&:strip).reject(&:blank?)
      permitted.except(:services_text)
    end
  end
end
