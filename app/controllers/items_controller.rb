class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new(item_params)
  end

  def create
    @item = Item.new(item_params)
    @item.create
  end

  def edit
    @item = Item.new(item_params)
    @item.save
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name
    )
  end
end
