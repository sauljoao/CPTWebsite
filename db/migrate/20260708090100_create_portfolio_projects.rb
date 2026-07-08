class CreatePortfolioProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :portfolio_projects do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :industry, null: false
      t.text :summary, null: false
      t.text :outcome, null: false
      t.jsonb :services, null: false, default: []
      t.integer :position, null: false, default: 0
      t.boolean :featured, null: false, default: false
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index :portfolio_projects, :slug, unique: true
    add_index :portfolio_projects, [ :published, :featured, :position ], name: "idx_portfolio_projects_visibility"
  end
end
