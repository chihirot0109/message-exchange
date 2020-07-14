class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @new_message = Message.new
    @num = current_user.id
    @recipient = User.find(@conversation.recipient_id)
    if @conversation.messages.present?
      @conversation.messages.each do |message|
        if message.sender != current_user
          message.read = true
          message.save
        else
          message
        end
      end
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
