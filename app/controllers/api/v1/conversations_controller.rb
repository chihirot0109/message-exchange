class Api::V1::ConversationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]

  def index
    @conversations = policy_scope(Conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
  end

  def create
    @conversation = Conversation.new(conversation_params)
    authorize @conversation
    if @conversation.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:starter_id, :recipient_id)
  end

  def render_error
    render json: { errors: @conversation.errors.full_messages },
      status: :unprocessable_entity
  end
end
