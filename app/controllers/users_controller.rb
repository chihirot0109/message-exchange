class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = policy_scope(User).all.page(params[:page]).per(20)
  end
end
