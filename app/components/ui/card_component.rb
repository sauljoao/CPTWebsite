module Ui
  class CardComponent < ApplicationComponent
    VARIANTS = {
      default: "cpt-card",
      soft: "cpt-card-soft",
      dark: "cpt-card-dark",
      flat: "rounded-lg border border-[#e8dfef] bg-white p-6"
    }.freeze

    def initialize(classes: nil, variant: :default)
      @classes = classes
      @variant = variant
    end

    def classes
      [ VARIANTS.fetch(@variant.to_sym), @classes ].compact.join(" ")
    end
  end
end
