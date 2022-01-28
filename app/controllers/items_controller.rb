class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @items = @user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: '商品を登録しました。'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, alert: '商品を削除しました'
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name
    ).merge(user_id: current_user.id)
  end
end
