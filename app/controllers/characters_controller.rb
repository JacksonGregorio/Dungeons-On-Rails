class CharactersController < ApplicationController
  before_action :set_character, only: [ :update, :destroy, :show,:edit]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def show
  end
  
  def edit 
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: 'Character was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: 'Character was successfully destroyed.'
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:strength, :intelligence, :dexterity, :wisdom, :charisma, :level, :player_id, :armor_id)
  end
end