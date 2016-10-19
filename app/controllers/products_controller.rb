class ProductsController < ApplicationController
  def index
    # @product = Category.with_products
      @product = Product.all
      @categories = Category.all

  end

  def new
    @categories = Category.all
  end

  def create

    new_product = Product.new(name: params[:name], description: params[:description], pricing: params[:pricing], category_id: params["category_id"])
    if (new_product.save)
      redirect_to '/products'
    else
      flash[:errors] = new_product.errors.full_messages
      redirect_to :back
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    edit_product = Product.find(params[:id])
    edit_product.update(name: params[:name], description: params[:description], pricing: params[:pricing]) 
    if (edit_product.save)
      redirect_to '/products'
    else
      flash[:errors] = edit_product.errors.full_messages
      redirect_to :back
    end
  end

  def confirmation
    @product = Product.find(params[:id])
  end

  def destroy
      product = Product.find(params[:id])
      product.destroy
      edirect_to "/products"
  end
end
