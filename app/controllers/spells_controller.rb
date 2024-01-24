class SpellsController < ApplicationController
  before_action :set_spell, only: [:update, :destroy]

  def index
    @spells = Spell.all
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      redirect_to @spell, notice: 'Spell was successfully created.'
    else
      render :new
    end
  end

  def update
    if @spell.update(spell_params)
      redirect_to @spell, notice: 'Spell was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spell.destroy
    redirect_to spells_url, notice: 'Spell was successfully destroyed.'
  end

  private

  def set_spell
    @spell = Spell.find(params[:id])
  end

  def spell_params
    params.require(:spell).permit(:name, :type, :description, :demage, :levelcast, :character_id)
  end
end
