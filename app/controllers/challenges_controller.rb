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
      @date = current_user.days.last.date
      @week = @date.cweek
      @challengeset.start_date = @week
      @challengeset.save
      redirect_to friends_path
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:nb_days_veggie, :message, params[:format])
  end
end
