class FriendsController < ApplicationController

  def index
    @friends = Friend.where(friend1_user: current_user, status: ["OK", "pending"]).or(Friend.where(friend2_user: current_user, status: ["OK", "pending"])).order(status: :desc)
    @my_friends = @friends.map do |friend|
      if friend.friend1_user == current_user
        friend.friend2_user
      else
        friend.friend1_user
      end
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.friend1_user = current_user
    @friend.friend2_user_id = params[:friend][:friend2_user].to_i
    @friend.save
    if @friend.save
      redirect_to friends_path
    end
  end

  def validated
    friend = Friend.find(params[:id])
    friend.update(status: "OK")
    redirect_to friends_path
  end

  def refused
    friend = Friend.find(params[:id])
    friend.update(status: "KO")
    redirect_to friends_path
  end

  def update
    @friend = Friend.find(params[:id])
    @friend.update(friend_params)
    redirect_to friends_path
  end

  def destroy
    @friend = Friend.find_by("friend1_user_id= ? AND friend2_user_id= ? or friend1_user_id= ? AND friend2_user_id= ?", current_user.id, params[:id], params[:id], current_user.id)
    @friend.destroy
    redirect_to friends_path
  end

  private

  def friend_params
    params.require(:friend).permit(:friend1_user_id, :friend2_user_id)
  end
end
