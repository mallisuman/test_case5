class ProductsController < ApplicationController
  before_action :login_required
  
  def index
    # @products = Product.all

    # @products = Product.where(user_id: current_user.user_id)
    # @products = Product.where(category_id: current_user.category_id)
    # @products = User.where(user_id: params[:id])

    @products = Product.joins(:user).left_outer_joins(:category).where(users: { uid: current_user.id }) 
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)
    @product.uid = current_user.id

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
 
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:cid, :name)
    end
end
