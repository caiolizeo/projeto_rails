class ProductsController < ApplicationController
  def show
    p params
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.create(name: params[:product][:name],
                           description: params[:product][:description],
                           category: params[:product][:category],
                           value: params[:product][:value],
                           selected: 0
                          )
    
    redirect_to root_path
    
  end

  def update
    product = Product.find params[:id]

    if product.selected.zero?
      product.update(:selected => 1) 
    else
      product.update(:selected => 0)
    end

    redirect_to root_path
  end

  def checkout
    @products = Product.where(selected: 1)
  end

  def finish
    Product.where(selected: 1).each do |product|
      product.delete
    end
    redirect_to root_path
  end

end