class ProductsController < ApplicationController
  def show
    p params
    @product = Product.find params[:id]
  end

  def update
    product = Product.find params[:id]
    product.update(:selected => 1)
    redirect_to root_path
  end

  def destroy
    Product.delete params[:id]
    redirect_to root_path
  end
end