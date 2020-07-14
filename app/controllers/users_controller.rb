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
end
