class ConversationsController < ApplicationController
  # skip_after_action :verify_policy_scoped, only: :index
  # def index
  #   with_messages = current_user.conversations.joins(:messages).order('messages.created_at DESC').uniq
  #   without_messages = current_user.conversations.includes(:messages).where(messages: { conversation_id: nil })
  #   @conversations = with_messages + without_messages
  #   @conversations = Kaminari.paginate_array(@conversations).page(params[:page]).per(20)
  # end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @new_message = Message.new
    @recipient = User.find(@conversation.recipient_id)
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
