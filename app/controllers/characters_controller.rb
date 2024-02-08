class CharactersController < ApplicationController
  before_action :set_character, only: [:update, :destroy, :show, :edit]
  before_action :authorize_request, except: [:show]

  def edit
  end
  
  def show
  end

  def index
    @characters = Character.all
    @characters_filter_player = filter_characters_by_player
  end

  def new
    @character = Character.new
  end

  def filter_characters_by_player
      filter_by_name if params[:name].present?
      filter_by_level if params[:level].present?
      player_id = @current_player_id
      @characters = Character.where(player_id: player_id)
      @characters
  end

  def create
    player_id = @current_user['player_id']['$oid']
    puts player_id, 'current_player'

    @character = Character.new(character_params.merge(player_id: player_id))
    

    if @character.save
      redirect_to "/characters/index", notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def update
    if @character.update(character_params)
      redirect_to "/characters/index", notice: 'Character was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to "/characters/index", notice: 'Character was successfully destroyed.'
  end

  private

  def filter_by_name
    player_id = @current_user['player_id']['$oid']
    @characters = Character.where(name: params[:name], player_id: player_id)
  end

  def filter_by_level
    player_id = @current_user['player_id']['$oid']
    @characters = Character.where(level: params[:level], player_id: player_id)
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:strength, :intelligence, :dexterity, :wisdom, :charisma, :level, :name_character, :player_id)
  end
end