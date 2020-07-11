class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all.page(params[:page]).per(20)
  end
end
