class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 
  before_action :set_clients
  before_action :set_dishes

  def index
    @orders = Order.where(nil)
    @search = OrderSearch.new(params[:search])

    if params[:search].present? && params[:search] != ""
      @orders = @search.date_scope
    end
  end
  
  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_url(@order), notice: t('activerecord.attributes.order.order_created')  
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_url(@order), notice: t('activerecord.attributes.order.order_updated') 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @order.destroy
      redirect_to orders_url, notice: t('activerecord.attributes.order.order_destroyed') 
  end

  private
    def set_clients
      @clients = Client.all.map {|client| ["#{client.client_name} #{client.direction}", client.id]}
    end

    def set_dishes
      @dishes = Dish.all.map {|dish| ["#{dish.name} #{dish.price}", dish.id]}
    end

    def statuses
      Order.pluck(:status).uniq.map { |status| [status.capitalize, status] }
    end    
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_date, :status, :dish_id, :client_id)
    end
end
