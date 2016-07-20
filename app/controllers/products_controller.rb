class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  layout 'staff_layout', except: [:index, :show]

  respond_to :html

  def staff_index 
    @products = Product.order("name").page(params[:page]).per(5)

    respond_with(@products) 
  end

  def index
    @products = Product.order("name").page(params[:page]).per(5)

    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_staff_path
  end

  def update
    @product.update(product_params)
    redirect_to products_staff_path
  end

  def destroy
    @product.destroy
    redirect_to products_staff_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :picture, :onSpecial)
  end
end
