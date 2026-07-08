class Faq < ApplicationRecord
  validates :question, :answer, :category, presence: true

  scope :published, -> { where(published: true).order(:position, :question) }
end
