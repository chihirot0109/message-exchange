class UsersController < ApplicationController
  def index
    @users = policy_scope(User).where.not('id = ?', current_user.id).page(params[:page]).per(20)
    @conversations = Conversation.where('starter_id = ? OR recipient_id = ?', current_user.id, current_user.id)
    @new_conversation = Conversation.new
  end
end
