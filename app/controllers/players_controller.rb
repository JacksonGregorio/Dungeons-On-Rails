class PlayersController < ApplicationController
  before_action :set_player, only: [ :update, :destroy, :show, :edit]
  before_action :authorize_request, only: [:create, :update, :destroy, :show, :edit]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit 
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      redirect_to "/characters/index", notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to "/login", notice: 'Player was successfully destroyed.'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:username, :email, :password, :premium)
  end
end