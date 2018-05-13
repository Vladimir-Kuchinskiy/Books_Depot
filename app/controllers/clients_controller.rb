class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :update]
  before_action :require_admin, only: [:index, :show, :edit, :create, :update]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_url, notice: 'Client was successfully created.'
    else
      redirect_to new_client_url
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
      else
        format.html { redirect_to clients_path }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully deleted.' }
      format.js
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone_number)
  end

end
