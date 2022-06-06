class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item.create(item_params)
  end

  private
  def item_parrams
    params.require(:item).permit()
  
end
