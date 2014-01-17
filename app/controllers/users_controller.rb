class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :add_tally, except: [:stats]
  before_action :add_stat_tally, only: [:stats]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    if current_user.present?
    else
      redirect_to '/sessions/new', notice: "Please login."
    end 
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    @user.user_name.downcase!


    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def stats
  end


private
  def add_tally
    @tally.user_views += 1
    @tally.save
  end

  def add_stat_tally
    @tally.stat_views += 1
    @tally.save
  end

  def set_user
    @user = current_user
  end

  def user_params 
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
