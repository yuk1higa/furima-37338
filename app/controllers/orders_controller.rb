class OrdersController < ApplicationController
  before_action :authenticate_user!

def index
  @item = Item.find(params[:item_id])
  @purchase_form = PurchaseForm.new
end

def create
  @item = Item.find(params[:item_id])
  @purchase_form = PurchaseForm.new(order_params)
  if @purchase_form.valid?
    pay_item
    @purchase_form.save
    redirect_to root_path
  else
    render :index
  end
end


private
def order_params
  params.require(:purchase_form).permit(:post_number, :area_id, :municipalitie, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end