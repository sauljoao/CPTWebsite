module Ui
  class BadgeComponent < ApplicationComponent
    def initialize(text:, tone: :blue)
      @text = text
      @tone = tone
    end
  end
end
