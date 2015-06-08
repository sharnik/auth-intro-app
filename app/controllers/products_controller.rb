class ProductsController < ApplicationController
  before_filter :authenticate, except: :index

  def new
    @product = Product.new
  end

  def create
    @product = Product.create product_params
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
