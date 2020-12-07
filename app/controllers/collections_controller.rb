class CollectionsController < ApplicationController
  def index
    @badges = Badge.all
    if Collection.all.count == 0
      @badges.each do |badge|
        Collection.create(counter: 0, badge_id: badge.id, user_id: current_user.id)
      end
    end
  end

  def show
    @badge = Badge.find(params[:id])
    @collection = Collection.find_by(badge: @badge, user: current_user)
  end
end
