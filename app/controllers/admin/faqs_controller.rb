module Admin
  class FaqsController < BaseController
    before_action :set_faq, only: [ :show, :edit, :update, :destroy ]

    def index
      @faqs = Faq.order(:position, :question)
    end

    def show
    end

    def new
      @faq = Faq.new
    end

    def edit
    end

    def create
      @faq = Faq.new(faq_params)

      if @faq.save
        redirect_to admin_faq_path(@faq), notice: "FAQ created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @faq.update(faq_params)
        redirect_to admin_faq_path(@faq), notice: "FAQ updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @faq.destroy
      redirect_to admin_faqs_path, notice: "FAQ deleted."
    end

    private

    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer, :category, :position, :published)
    end
  end
end
