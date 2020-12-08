class ChallengesetsController < ApplicationController
  def new
    @challengeset = Challengeset.new
    @friend = Friend.where(friend1_user: current_user, friend2_user: params[:friend_id]).or(Friend.where(friend2_user: current_user, friend1_user: params[:friend_id]))
  end
end
