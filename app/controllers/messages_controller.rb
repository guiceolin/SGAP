class MessagesController < ApplicationController
  respond_to :json
  def index
    conversation = current_user.conversations.find(params[:conversation_id])
    respond_with conversation.messages
  end

  def create
    conversation = current_user.conversations.find(params[:message].delete(:conversation_id))
    @message = Message.new(params[:message])
    @message.conversation = conversation
    @message.user = current_user
    @message.save
    head :created#respond_with @message
  end
end
