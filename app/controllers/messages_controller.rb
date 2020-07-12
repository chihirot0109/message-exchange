class MessagesController < ApplicationController
  before_action :set_message, only: [:update, :destroy]
  before_action :set_conversation, only: [:create]

  def index
    @messages = policy_scope(Message).where('conversation_id = ?', params[:conversation_id])
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.conversation = @conversation
    @message.sender_id = current_user.id
    raise
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        message: render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to conversation_path(@conversation, anchor: "message-#{@message.id}")
    else
      render 'conversations/show'
    end
  end

  def update
    @message.update(message_params)
    if @message.save
      redirect_to conversation_path(@conversation, anchor: "message-#{@message.id}")
    else
      render 'conversations/show'
    end
  end

  def destroy
    if @message.destroy
      redirect_to conversation_path(@conversation)
    else
      render 'conversations/show'
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
