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
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
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
      # Useful symbols to work with the queries in this method
      :Vitamina
      :Proteína
      :Carbohidrato
      :Mineral
      :Grasa
      @components_ids_marked = []

      @components_marked = Hash.new
      @components_all = Hash.new

      # Store all components within a has named after the ComponentType.name
      ComponentType.all.each do |component_type|
        @components_all[component_type.name] = Component.where(component_types_id: component_type.id)
      end

      if params[:id]
        # Fetching the component_id values for every Food matching the :id given
        # within the "params" hash.
        FoodsDatum.where(foods_id: params[:id]).each do |foods_datum|
          #TODO
          @components_marked[
            Component.find(id: foods_datum.components_id).component_types_id
            ] foods_datum.components_id
        end
        @components_ids_marked.uniq

        # Fetching the components names that match any value within the 
        # @component_types_ids.
        Component.where(id: @components_ids_marked).each do |component|
          @components_marked.append component
        end
        @components_marked.uniq
      end

      # Deleting repeated values from all arrays
      @component_names_marked = []
      @component_ids_marked = []
      @component_names_all = []
      @component_ids_all = []      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :description, :properties, :vitamins, :carbs, :fats, :minerals, :proteins)
    end
end
