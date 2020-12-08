class ProfilesController < ApplicationController
  def index
    @friend = Friend.new
    if params[:query].present?
      @users = User.where("nickname ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
      @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
      @my_friends = @friends.map do |friend|
        if friend.friend1_user == current_user
          friend.friend2_user
        else
          friend.friend1_user
        end
      end
      @users_not_my_friend = @users.reject do |user|
        @my_friends.include?(user) || user == current_user
      end
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :photo)
  end
end


