class BackpacksController < ApplicationController
  before_action :set_backpack, only: [ :update, :destroy, :show, :edit]
  before_action :authorize_request, only: [:create, :update, :destroy, :show, :edit]

  def show
  end
  
  def edit 
  end

  def index
    @backpacks = Backpack.all
  end

  def new
    @backpack = Backpack.new
  end

  def create
    @backpack = Backpack.new(backpack_params)

    if @backpack.save
      redirect_to "/backpacks/index", notice: 'Backpack was successfully created.'
    else
      render :new
    end
  end

  def update
    if @backpack.update(backpack_params)
      redirect_to "/backpacks/index", notice: 'Backpack was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @backpack.destroy
    redirect_to "/backpacks/index", notice: 'Backpack was successfully destroyed.'
  end

  private

  def set_backpack
    @backpack = Backpack.find(params[:id])
  end

  def backpack_params
    params.require(:backpack).permit(:character_id)
  end
end