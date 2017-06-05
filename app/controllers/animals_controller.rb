class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show

    @preys_id = @animal.preys_id
    @preys_id = @preys_id.gsub('"", ', '')
    @preys_id = @preys_id.split(',')
    
    @preys_id = @preys_id.map {|i|
    i = i.gsub('["', '')
    i = i.gsub('"', '')
    i = i.gsub(' "', '')
    i = i.gsub('"]', '')
    i = i.gsub(']', '')
    i = i.gsub(' ', '')
    i
    }
    # C'est un tableau à partir de maintenant
    # @preys_id.first = @preys_id.first.gsub('["', '')
    puts @preys_id
    # puts @try 
      # @preys_id.map(&:to_i)
      # @predators_id.map(&:to_i)

    @preys = Animal.where(id: @preys_id)
    puts @preys
    puts @preys.name

    @predators_id = @animal.predators_id
    @predators_id = @predators_id.gsub('"", ', '')
    @predators_id = @predators_id.split(',')
    @predators_id = @predators_id.map {|i|
    i = i.gsub('["', '')
    i = i.gsub('"', '')
    i = i.gsub(' "', '')
    i = i.gsub('"]', '')
    i = i.gsub(']', '')
    i = i.gsub(' ', '')
    i
    }

    @predators = Animal.where(id: @predators_id)
    puts @predators
    puts @predators.name

  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit

  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.preys_id = @animal.preys_id.gsub('"", ', '')
    @animal.predators_id = @animal.predators_id.gsub('"", ', '')

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :longevity, :preys_id => [], :predators_id => [])
    end
end
