class FoodsController < ApplicationController
  before_action :set_properties
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to @food,
          notice: 'Food was successfully created.'
        }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # This method identifies the relationships between Food and ComponentType,
  # so those relationships can be rendered by the view.
  def set_properties
    @components_all = {}
    # Store all components within a hass named after the ComponentType.name
    ComponentType.all.each do |ct|
      @components_all[ct.name] = Component.where(component_types_id: ct.id)
    end
    product_components if params[:id]
  end

  def product_components
    @product_components = {}
    @components_all.keys.each do |ctn|
      @product_components[ctn] = []
    end
    FoodsDatum.where(foods_id: params[:id]).each do |fd|
      @product_components[
        ComponentType.find(
          Component.find(fd.components_id)
          .component_types_id).name].append Component.find(fd.components_id)
    end
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def food_params
    params.require(:food).permit(
      :name, :description, :properties,
      :vitamins, :carbs, :fats, :minerals, :proteins)
  end
end
