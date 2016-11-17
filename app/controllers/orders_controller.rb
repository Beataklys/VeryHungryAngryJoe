class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /orders
  # GET /orders.json
  def index
    @order = Order.new
    @orders = Order.order('restaurant_name').all

    @users = User.all
    @user = current_user


    respond_with(@orders)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = current_user.orders.build
    @user = current_user
  end
def create
  respond_to do |format|
    if @current_user
    @order = current_user.orders.build(order_params)
     @order.save
     format.html { redirect_to root_path}
   else format.html { redirect_to root_path, notice: 'Please sign in to make new order' }
    end
  end
end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def finalize
  @order= Order.find(params[:id])
  @order.finalize!
end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit( :restaurant_name, :dish_name, :order_status, :price)
  end
end
