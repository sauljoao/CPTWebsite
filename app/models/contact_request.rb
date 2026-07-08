class ContactRequest < ApplicationRecord
  REQUEST_TYPES = %w[contact quote meeting].freeze
  STATUSES = %w[new contacted closed].freeze

  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :request_type, inclusion: { in: REQUEST_TYPES }
  validates :status, inclusion: { in: STATUSES }
end
