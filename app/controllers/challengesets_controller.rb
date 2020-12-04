class ChallengesetsController < ApplicationController
  def new
    @challengeset = Challengeset.new
  end
end
