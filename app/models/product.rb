class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, :description, :cta_label, presence: true
  validates :base_price_cents, numericality: { greater_than_or_equal_to: 0 }

  scope :published, -> { where(published: true).order(:position, :name) }

  def price
    base_price_cents / 100
  end

  def starting_price
    "A partir de #{ApplicationController.helpers.number_to_currency(price, precision: 0)}"
  end
end
