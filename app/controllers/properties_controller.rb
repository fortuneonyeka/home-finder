class PropertiesController < ApplicationController
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_account!, only: [:new, :create, :update, :destroy, :edit, :show]

  # GET /properties or /properties.json
  def index
    @properties = Property.all.with_attached_image
  end

  # GET /properties/1 or /properties/1.json
  def show
    # the @property instance variable has already been set by the set_property method
    # @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    # the @property instance variable has already been set by the set_property method
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id
    @property.image.attach(params[:property][:image])

    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:description, :phone, :email, :address, :price, :rooms, :bathrooms, :image)
    end
end
