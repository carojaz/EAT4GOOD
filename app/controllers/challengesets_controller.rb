class ChallengesetsController < ApplicationController
  def index
    @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
    @challengesets = []
    @friends.each do |friend|
      challset = Challengeset.where(friend_id: friend)
      @challengesets << challset unless challset == []
    end
  end
end
