class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
    @friend = Friend.where(friend1_user: current_user, friend2_user: params[:format]).or(Friend.where(friend2_user: current_user, friend1_user: params[:format]))
  end

  def create
    @friend = Friend.where(friend1_user: current_user, friend2_user: params[:format]).or(Friend.where(friend2_user: current_user, friend1_user: params[:format]))
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      @challengeset = Challengeset.new
      @challengeset.friend = @friend.first
      @challengeset.challenge = @challenge
      @date = Date.today
      @week = @date.cweek
      @challengeset.start_date = @week + 1
      if Challengeset.find_by(friend: @friend, start_date: @week + 1)
        @challenge = Challenge.new(challenge_params)
        flash[:notice] = "You already challenge this friend for the next week"
        render :new
      else
        @challengeset.save
        redirect_to friends_path
      end
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:nb_days_veggie, :message, params[:format])
  end
end
