class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
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
