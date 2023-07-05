class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 
  include UserAdministratorTypeAuthorization
  before_action :set_clients
  before_action :set_dishes

  def index
    @orders = Order.where(nil)
    @search = OrderSearch.new(params[:search])

    if params[:search].present? && params[:search] != ""
      @orders = @search.date_scope
    end
end
  

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_date, :status, :dish_id, :client_id)
    end
end
