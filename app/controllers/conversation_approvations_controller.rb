class ConversationApprovationsController < ApplicationController

  respond_to :html, :json
  def index
    respond_with (@unapproved_conversations = Conversation.where(:approved => false))
  end

  def update
    @conversation = Conversation.find_by_id(params[:id])
    @conversation.approved = true
    @conversation.save
    redirect_to conversation_approvations_path
  end

  def destroy
    @conversation = Conversation.find_by_id(params[:id])
    @conversation.destroy
    redirect_to conversation_approvations_path
  end

end

