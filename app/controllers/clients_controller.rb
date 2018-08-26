class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if !check_client.nil? && @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy 
    unless @client.active? 
      @client.destroy
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      if params[:id].include? '-'
        @client = Client.where(uuid: params[:id])
      else
        @client = Client.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:email, :domain, :ipv4, :ipv6, :uuid, :secret_key)
    end
    
    def check_client
     Client.find_by_secret_key(params[:client][:secret_key])
    end
end
