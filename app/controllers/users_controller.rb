class UsersController < ApplicationController
<<<<<<< HEAD
  def index
    @users = policy_scope(User).all.page(params[:page]).per(20)
=======
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = policy_scope(User).all
>>>>>>> 66ec2ea... created users by faker
  end
end
