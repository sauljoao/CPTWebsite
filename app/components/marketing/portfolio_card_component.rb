module Marketing
  class PortfolioCardComponent < ApplicationComponent
    ACCENTS = {
      landing: {
        surface: "bg-[#fff1e7]",
        ink: "text-[#9a3412]",
        button: "bg-[#f97316]"
      },
      website: {
        surface: "bg-[#f4edff]",
        ink: "text-[#5b21b6]",
        button: "bg-[#7c3aed]"
      },
      ecommerce: {
        surface: "bg-[#fff8df]",
        ink: "text-[#854d0e]",
        button: "bg-[#facc15]"
      },
      custom: {
        surface: "bg-[#18111f]",
        ink: "text-[#facc15]",
        button: "bg-[#18111f]"
      }
    }.freeze

    def initialize(project:)
      @project = project
      @accent = ACCENTS.fetch(project.product_kind)
    end
  end
end
