class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  # GET /inventories or /inventories.json
  def index  
    if logged_in?(:site_admin)
      @inventories = Inventory.all
    else
      @inventories = Inventory.published
    end    
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    if logged_in?(:site_admin) == false && @inventory.draft?
      redirect_to product_path(@inventory.product_id), notice: 'You are not authorized to view this page!' 
    end
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
    @inventory.product_id= params[:product_id]
    @product_title = Product.find(@inventory.product_id).title
  end

  # GET /inventories/1/edit
  def edit
    @product_title = Product.find(@inventory.product_id).title
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    @product_title = Product.find(@inventory.product_id).title

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to product_path(@inventory.product_id), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    @product_title = Product.find(@inventory.product_id).title

    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to product_path(@inventory.product_id), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy

    #To remove images from s3
    @inventory.image.remove!

    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:color, :size, :quantity, :product_id, :price, :image, :status)
    end
end
