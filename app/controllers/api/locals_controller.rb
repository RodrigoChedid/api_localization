class Api::LocalsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_local, only: [:show, :update, :destroy]
  
  # GET /locals
  def index
    @locals = current_api_user.locals.all

    render json: @locals
  end

  # GET /locals/1
  def show
    render json: @local
  end

  # POST /locals
  def create
    @local = current_api_user.locals.new(local_params)

    if @local.save
      render json: @local, status: :created, location: api_local_url(@local)
    else
      render json: @local.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locals/1
  def update
    if @local.update(local_params)
      render json: @local
    else
      render json: @local.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locals/1
  def destroy
    @local.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = current_api_user.locals.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def local_params
      params.require(:local).permit(:user_id, :cep, :address,:state, :city, :district, :lat, :lon)
    end
end
