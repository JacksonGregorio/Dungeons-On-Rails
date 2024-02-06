class AbilitiesController < ApplicationController
  before_action :set_ability, only: [ :update, :destroy, :show, :edit]
  before_action :authorize_request, only: [:create, :update, :destroy, :show, :edit]

  def index
    @abilities = Ability.all
  end

  def new
    @ability = Ability.new
  end

  def show
  end

  def edit 
  end

  def create
    @ability = Ability.new(ability_params)

    if @ability.save
      redirect_to "/abilities/index", notice: 'Ability was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ability.update(ability_params)
      redirect_to "/abilities/index", notice: 'Ability was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ability.destroy
    redirect_to "/abilities/index", notice: 'Ability was successfully destroyed.'
  end

  private

  def set_ability
    @ability = Ability.find(params[:id])
  end

  def ability_params
    params.require(:ability).permit(:name, :type, :description, :demage, :character_id)
  end
end
