class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @order = Order.new
    @orders = Order.order('restaurant_name').all
    @users = User.all
    @user = current_user
    respond_with(@orders)
  end

  def new
    @order = current_user.orders.build
    @user = current_user
  end

  def create
    @order = current_user.orders.build(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
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
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit( :restaurant_name, :dish_name, :order_status, :price)
  end
end
