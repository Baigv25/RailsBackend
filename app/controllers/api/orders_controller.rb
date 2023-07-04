module Api 
    class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_order, only: %i[ show edit update destroy ]
  
      def index
        @orders = Order.all
      end
  
      def show
      end
  
      def new
        @order = Order.new
      end
  
      def edit
      end
  
      def create
        @order = Order.new(order_params)
  
  
          if @order.save
            render 'api/orders/show', status: :created
          else
            render json: @order.errors, status: :unprocessable_entity
          end
        
      end
  
      def update
        if @order.update(order_params)
          render 'api/orders/show', status: :ok, location: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @order.destroy
  
          render 'api/orders/index', status: :ok
      end
    
  
      private
        def set_order
          @order = Order.find(params[:id])
        end
  
        def order_params
            params.require(:order).permit(:order_date, :status, :dish_id, :client_id)
        end
    end
  end