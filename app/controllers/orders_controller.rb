class OrdersController < ApplicationController

  def add_meal
    # session[:meal_id] = nil
    @order = Order.create(meal_id: session[:meal_id], user_id: session[:user_id], date: Time.now)
    binding.pry
    @order.id = session[:order_id]
    # raise session.inspect
    flash[:notice] = "Meal added to Order"
    redirect_to orders_path
  end

  def index
    @user = User.find_by(id: session[:user_id])
    @orders = User.find_by(id: session[:user_id]).orders


    # @order_total
    session[:total] = Order.joins(:user).joins(:meal).sum("price")
    # @order_total =
    # binding.pry
    return @order_total = Order.joins(:user).joins(:meal).sum("price")
  end

  def destroy
    @order = Order.find(params[:id])
    @order.delete
    redirect_to orders_path

  end

  def total
    # binding
    @user = Order.find_by(id: session[:user_id])
    @order_total = Order.joins(:user).joins(:meal).sum("price")
    @order_total = session[:total]

    binding.pry

  end


end
