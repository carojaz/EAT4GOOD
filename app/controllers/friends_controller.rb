class FriendsController < ApplicationController
  def index
    @friends = Friend.all
    # Prendre le user qui a le friend id2
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
