module Sections
  class SectionComponent < ApplicationComponent
    def initialize(eyebrow: nil, title:, subtitle: nil, classes: nil)
      @eyebrow = eyebrow
      @title = title
      @subtitle = subtitle
      @classes = classes
    end
  end
end
