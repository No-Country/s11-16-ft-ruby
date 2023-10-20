# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create

    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product), notice: 'Product created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  def my_products
    @products = Product.where(user_id: current_user.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params[:product][:user_id] = current_user.id
    params.require(:product).permit(:title, :description, :price, :category_id, :user_id)
  end
end
