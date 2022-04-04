class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy get_display_image]
  before_action :get_inventories, only: %i[ show get_display_image ]
  before_action :get_display_image, only: %i[ show ]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  # GET /products or /products.json
  def index
    if logged_in?(:site_admin)
      @products = Product.all
    else
      @products = Product.published
    end
  end

  # GET /products/1 or /products/1.json
  def show
    if logged_in?(:site_admin) || @product.published?
      @product = Product.includes(:inventories).friendly.find(params[:id])
      @inventory = Inventory.new
    else
      redirect_to product_path, notice: 'You are not authorized to view this page!' 
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.category_id = params[:category_id]
    @category_title = Category.find(@product.category_id).title
  end

  # GET /products/1/edit
  def edit
    @category_title = Category.find(@product.category_id).title
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @category_title = Category.find(@product.category_id).title

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        # format.html { render :new, :locals => {category_id:params[:category_id], category_title: params[:category_title]}, status: :unprocessable_entity }
        # flash[:error]
        format.html { render :new, status: :unprocessable_entity }
        # format.html { redirect_to new_product_path, flash[:error] => @product.errors.full_messages.join(', '), status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @category_title = Category.find(@product.category_id).title
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def get_inventories
      @inventories = Inventory.where(product_id: @product.id)
    end

    def get_display_image
      @inventories.each do |inventory|
        if inventory.image.url 
          @image = inventory.image.url 
          puts "***************************"
          puts inventory.image
          puts "***************************"
          break
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :category_id, :status)
    end
end
