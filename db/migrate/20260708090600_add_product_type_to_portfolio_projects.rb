class AddProductTypeToPortfolioProjects < ActiveRecord::Migration[8.1]
  def change
    add_column :portfolio_projects, :product_type, :string, null: false, default: "Website"
    add_index :portfolio_projects, [ :product_type, :published, :position ], name: "idx_portfolio_projects_product_type"
  end
end
