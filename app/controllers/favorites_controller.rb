class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show; end

  def new; end

  def edit; end

  def update; end

  # def create
  #   # product = Product.find(params[:product_id])
  #   # favorite = current_user.favorites.create(product: product)
  #   product.favorite!
  #   respond_to do |format|
  #     format.html do
  #       redirect_to product_path(product)
  #     end
  #     format.turbo_stream do
  #       render turbo_stream: turbo_stream.replace('favorites', partial: 'products/favorite', locals: { product: product })
  #     end
  #   end
  # end

  # def destroy
  #   # favorite = current_user.favorites.find_by(product_id: params[:product_id])
  #   # favorite.destroy if favorite
  #   product.unfavorite!
  #   respond_to do |format|
  #     format.html do
  #       redirect_to product_path(product), status: :see_other
  #     end
  #     format.turbo_stream do
  #       render turbo_stream: turbo_stream.remove(favorite)
  #     end
  #   end
  # end


  def create
    product = Product.find(params[:product_id])
    # favorite = current_user.favorites.create(product: @product)
    product.favorite!
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append('favorites', partial: 'products/favorite', locals: { product: @product })
      end
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(product_id: params[:product_id])
    # favorite.destroy if favorite
    product.unfavorite!
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(favorite)
      end
    end
  end


  private

  def product
    @product ||= Product.find(params[:product_id])
  end

end
