class Api::V1::MessagesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:show]

  def show
    @message = Message.find(params[:id])
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    authorize @message
    @message.conversation = @conversation
    if @message.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :content)
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
      status: :unprocessable_entity
  end
end
