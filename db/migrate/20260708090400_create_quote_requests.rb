class CreateQuoteRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :quote_requests do |t|
      t.references :product, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :company
      t.text :message
      t.jsonb :configuration, null: false, default: {}
      t.integer :estimated_price_cents, null: false, default: 0
      t.string :status, null: false, default: "new"

      t.timestamps
    end

    add_index :quote_requests, [ :status, :created_at ]
  end
end
