class FriendsController < ApplicationController

  def index
    @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.friend1_user_id = current_user
    # @friend.friend2_user_id = (recuperer au click le id du user)
    @friend.save
  end

  def update
    # a faire
  end
end
