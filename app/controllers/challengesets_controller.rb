class ChallengesetsController < ApplicationController
  def index
    @date = Date.today
    @week = @date.cweek
    @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
    @challengesets = []
    @friends.each do |friend|
      challset = Challengeset.where(friend_id: friend)
      @challengesets << challset unless challset == []
    end
    @chall = @challengesets.flatten
    @chall.sort! { |a, b| b[:start_date] <=> a[:start_date] }
  end
end
