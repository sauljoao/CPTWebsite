class PortfolioProject < ApplicationRecord
  extend FriendlyId

  PRODUCT_TYPES = [ "Landing Page", "Website", "Ecommerce Website", "Custom Solution" ].freeze

  friendly_id :title, use: :slugged

  validates :title, :industry, :summary, :outcome, :product_type, presence: true
  validates :product_type, inclusion: { in: PRODUCT_TYPES }

  scope :published, -> { where(published: true).order(:position, :title) }
  scope :featured, -> { published.where(featured: true) }

  def product_kind
    {
      "Landing Page" => :landing,
      "Website" => :website,
      "Ecommerce Website" => :ecommerce,
      "Custom Solution" => :custom
    }.fetch(product_type)
  end
end
