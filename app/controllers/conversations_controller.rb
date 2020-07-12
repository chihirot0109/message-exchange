class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @new_message = Message.new
    if @conversation.starter_id == current_user.id
      @recipient = User.find(@conversation.recipient_id)
    else
      @recipient = User.find(@conversation.starter_id)
    end
  end

  def create
    @conversation = Conversation.new(conversation_params)
    authorize @conversation
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render 'users/index'
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:starter_id, :recipient_id)
  end
end
