class FaqsController < ApplicationController
  def index
    @faqs = Faq.published.group_by(&:category)
  end
end
