class ConversationsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @conversations = current_user.conversations.includes(:messages).order('messages.created_at DESC')
    @conversations = @conversations.page(params[:page]).per(20)
  #   with_messages = []
  #   without_messages = []
  #   policy_scope(Conversation).where('user_id = ?', current_user.id).each do |conversation|
  #     if conversation.messages.present?
  #        with_messages.push(conversation)
  #     else
  #       without_messages.push(conversation)
  #     end
  #   end
  #   with_messages = with_messages.joins(:messages).order("messages.created_at DESC")
  #   without_messages = without_messages.order('recipient_id ASC')
  #   @conversations = without_messages.join(without_messages).page(params[:page]).per(20)
  end

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
