module Ui
  class ButtonComponent < ApplicationComponent
    def initialize(label: nil, href: nil, variant: :primary, type: "button", **options)
      @label = label
      @href = href
      @variant = variant
      @type = type
      @options = options
    end

    def call
      if @href
        link_to content, @href, **html_options
      else
        tag.button content, **html_options.merge(type: @type)
      end
    end

    private

    def content
      @label || helpers.capture(&@options.delete(:block))
    end

    def html_options
      @options.merge(class: [ base_classes, variant_classes, @options[:class] ].compact.join(" "))
    end

    def base_classes
      "inline-flex items-center justify-center rounded-full px-5 py-3 text-sm font-semibold transition focus:outline-none focus:ring-2 focus:ring-violet-600 focus:ring-offset-2"
    end

    def variant_classes
      case @variant.to_sym
      when :secondary
        "bg-white text-[#18111f] ring-1 ring-[#e8dfef] hover:bg-[#fff8df]"
      when :ghost
        "text-[#655d6f] hover:bg-[#f4edff] hover:text-[#18111f]"
      when :light
        "bg-[#fff8df] text-[#18111f] hover:bg-[#facc15]"
      when :dark
        "bg-[#18111f] text-white shadow-sm hover:bg-[#2b1b39]"
      else
        "bg-[#f97316] text-[#18111f] shadow-sm shadow-orange-500/20 hover:bg-[#facc15]"
      end
    end
  end
end
