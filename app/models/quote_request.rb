class QuoteRequest < ApplicationRecord
  STATUSES = %w[new reviewed accepted declined].freeze

  belongs_to :product, optional: true

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :status, inclusion: { in: STATUSES }
  validates :estimated_price_cents, numericality: { greater_than_or_equal_to: 0 }
end
