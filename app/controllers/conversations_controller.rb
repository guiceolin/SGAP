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
    @conversation = Conversation.new
    @users = User.find(params[:user_ids])
    @users.map do |user|
      @conversation.users << user
    end
    @conversation.users << current_user
    @conversation.save
    respond_with @conversation
  end
end
