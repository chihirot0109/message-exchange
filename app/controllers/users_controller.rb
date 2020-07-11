class UsersController < ApplicationController
<<<<<<< HEAD
  def index
    @users = policy_scope(User).all.page(params[:page]).per(20)
=======
  skip_before_action :authenticate_user!, only: [:index]

  def index
<<<<<<< HEAD
    @users = policy_scope(User).all
>>>>>>> 66ec2ea... created users by faker
=======
    @users = policy_scope(User).all.page(params[:page]).per(20)
>>>>>>> 43053ae... installed kaminari and paginate users
  end
end
