class ConversationsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with current_user.conversations
  end

  def show
    @participation = current_user.participations.where("conversation_id" => params[:id]).first
    @conversation = @participation.conversation
    last_read = @participation.read!
    respond_with @conversation, :last_read => (params[:last_read] || last_read)
  end

  def update
    @participation = current_user.participations.where("conversation_id" => params[:id]).first
    params[:message].delete(:user)
    message = Message.new(params[:message])
    message.user = current_user
    @participation.conversation.messages << message
    respond_with @participation.conversation
  end

  def create
    params[:conversation].delete(:messages)
    @conversation = Conversation.new(params[:conversation])
    @conversation.scope_type.capitalize!
    @conversation.save
    respond_with @conversation
  end
end
