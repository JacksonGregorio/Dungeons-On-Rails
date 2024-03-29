class ItemsController < ApplicationController
  before_action :set_item, only: [ :update, :destroy, :show, :edit]
  before_action :authorize_request, only: [:create, :update, :destroy, :show, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit 
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to "/items/index", notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to "/items/index", notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to "/items/index", notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :item_type, :description, :demage, :value, :effect, :backpack_id)
  end
end
