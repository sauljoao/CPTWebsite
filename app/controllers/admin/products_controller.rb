module Admin
  class ProductsController < BaseController
    before_action :set_product, only: [ :show, :edit, :update, :destroy ]

    def index
      @products = Product.order(:position, :name)
    end

    def show
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_product_path(@product), notice: "Product created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: "Product updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "Product deleted."
    end

    private

    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def product_params
      permitted = params.require(:product).permit(:name, :description, :base_price_cents, :cta_label, :position, :published, features_text: [])
      permitted[:features] = Array(params.dig(:product, :features_text)).flat_map { |item| item.to_s.split("\n") }.map(&:strip).reject(&:blank?)
      permitted.except(:features_text)
    end
  end
end
