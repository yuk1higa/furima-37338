class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @purchase_form = PurchaseForm.new
end

def create
  @item = Item.find(params[:item_id])
  @purchase_form = PurchaseForm.new(order_params)
  if @purchase_form.valid?
    @purchase_form.save
    redirect_to root_path
  else
    render :index
  end
end


private
def order_params
  params.require(:purchase_form).permit(:post_number, :area_id, :municipalitie, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
end
end