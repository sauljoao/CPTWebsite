class PortfolioProject < ApplicationRecord
  extend FriendlyId

  PRODUCT_TYPES = [ "Página de aterragem", "Website", "Loja online", "Solução à medida" ].freeze

  friendly_id :title, use: :slugged

  validates :title, :industry, :summary, :outcome, :product_type, presence: true
  validates :product_type, inclusion: { in: PRODUCT_TYPES }

  scope :published, -> { where(published: true).order(:position, :title) }
  scope :featured, -> { published.where(featured: true) }

  def product_kind
    {
      "Página de aterragem" => :landing,
      "Website" => :website,
      "Loja online" => :ecommerce,
      "Solução à medida" => :custom
    }.fetch(product_type)
  end
end
