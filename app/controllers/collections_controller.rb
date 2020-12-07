class CollectionsController < ApplicationController
  def index
    @badges = Badge.all
    if current_user.collections.count == 0
      @badges.each do |badge|
        Collection.create(counter: 0, badge_id: badge.id, user_id: current_user.id)
      end
    end
    up_counter
  end

  def show
    @badge = Badge.find(params[:id])
    @collection = Collection.find_by(badge: @badge, user: current_user)
  end

  def up_counter
    @days = Day.where(user: current_user).to_a
    @asparagus_badge = Badge.where(name: "Asparagus")
    @collection1 = Collection.find_by(badge: @asparagus_badge, user: current_user)
    @collection1.counter = 0
    @brocoli_badge = Badge.where(name: "Broccoli")
    @collection2 = Collection.find_by(badge: @brocoli_badge, user: current_user)
    @collection2.counter = 0
    @mushroom_badge = Badge.where(name: "Mushroom")
    @collection3 = Collection.find_by(badge: @mushroom_badge, user: current_user)
    @collection3.counter = 0
    @days.each do |day|
      @collection1.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection1.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection1.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection1.save

      @collection2.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection2.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection2.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection2.save

      @collection3.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection3.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection3.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection3.save
    end
  end
end
