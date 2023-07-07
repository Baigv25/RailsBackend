class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 
  include UserAdministratorTypeAuthorization

  def index
    @clients = Client.all
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_url(@client), notice: t('activerecord.attributes.client.client_created') 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_url(@client), notice: t('activerecord.attributes.client.client_updated') 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: t('activerecord.attributes.client.client_destroyed')
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:client_name, :email, :client_password, :direction, :status_client)
    end
end
