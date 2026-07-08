class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.integer :base_price_cents, null: false
      t.string :cta_label, null: false, default: "Request a quote"
      t.jsonb :features, null: false, default: []
      t.integer :position, null: false, default: 0
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index :products, :slug, unique: true
    add_index :products, [ :published, :position ]
  end
end
