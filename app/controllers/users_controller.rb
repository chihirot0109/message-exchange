class UsersController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @conversations = current_user.conversations.joins(:messages).order('messages.created_at DESC').uniq
    @users = User.where.not(id: @conversations.pluck(:starter_id, :recipient_id).flatten.uniq)
    @users = @users.where.not('id = ?', current_user.id)
    @list = @conversations + @users
    @list = Kaminari.paginate_array(@list).page(params[:page]).per(20)
    @new_conversation = Conversation.new
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    if Conversation.find_by(starter_id: params[:id])
      @conversation = Conversation.find_by(starter_id: params[:id])
    elsif Conversation.find_by(starter_id: params[:id])
      @conversation = Conversation.find_by(starter_id: params[:id])
    else
      @conversation = nil
    end
  end
end
