# encoding=utf-8
class Api::MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate
  before_filter :set_message, only: [:show, :edit, :update, :destroy]
  
  # GET /api/messages.json
  def index
    @messages = @current_user.messages

    respond_to do |format|
      format.json { render json: @messages }
    end
  end

  # GET /api/messages/1.json
  def show
    respond_to do |format|
      format.json { render json: @message }
    end
  end

  # POST /api/messages.json
  def create
    @message = Message.new(params[:message])
    @message.user = @current_user

    respond_to do |format|
      if @message.save
        format.json { render json: @message, status: :created, location: @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/messages/1.json
  def update
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.json { head :no_content }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |u, p|
      @current_user = User.where(email: u).first
      @current_user.auth_key == p ? @current_user : false
    end
  end

  def set_message
    @message = Message.find(params[:id])
    raise ActionController::RoutingError.new('Forbidden') unless @message.user_id == @current_user.id
  end
end
