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
    # Badges veggie meals
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

    # badges challenges
    @date = Date.today
    @week = @date.cweek
    @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
    @challengesets = []
    @friends.each do |friend|
      challset = Challengeset.where(friend_id: friend)
      @challengesets << challset unless challset == []
    end
    @chall = @challengesets.flatten
    counter = @chall.count

    @orange_badge = Badge.where(name: "Orange")
    @collection4 = Collection.find_by(badge: @orange_badge, user: current_user)
    @collection4.counter = counter
    @collection4.save

    @pineapple_badge = Badge.where(name: "Pineapple")
    @collection5 = Collection.find_by(badge: @pineapple_badge, user: current_user)
    @collection5.counter = counter
    @collection5.save

    @pomegranate_badge = Badge.where(name: "Pomegranate")
    @collection6 = Collection.find_by(badge: @pomegranate_badge, user: current_user)
    @collection6.counter = counter
    @collection6.save

    # badges positives
    @days = Day.where(user: current_user).to_a

    @radish_badge = Badge.where(name: "Radish")
    @collection6 = Collection.find_by(badge: @radish_badge, user: current_user)
    @collection6.counter = 0

    @salad_badge = Badge.where(name: "Salad")
    @collection7 = Collection.find_by(badge: @salad_badge, user: current_user)
    @collection7.counter = 0

    @tangerine_badge = Badge.where(name: "Tangerine")
    @collection8 = Collection.find_by(badge: @tangerine_badge, user: current_user)
    @collection8.counter = 0

    @days.each do |day|
      @collection6.counter += 1 if (day.breakfast.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.lunch.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.dinner.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish")
      @collection6.save

      @collection7.counter += 1 if (day.breakfast.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.lunch.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.dinner.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish")
      @collection7.save

      @collection8.counter += 1 if (day.breakfast.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.lunch.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish") && (day.dinner.foodtype.name == "Veggie" || "Dairy" || "Meat" || "Fish")
      @collection8.save
    end

    # badges objectifs

    # badges amis
    @friends = Friend.where(friend1_user: current_user).or(Friend.where(friend2_user: current_user))
    @count = @friends.count

    @corn_badge = Badge.where(name: "Corn")
    @collection13 = Collection.find_by(badge: @corn_badge, user: current_user)
    @collection13.counter = @count
    @collection13.save

    @eggplant_badge = Badge.where(name: "Eggplant")
    @collection14 = Collection.find_by(badge: @eggplant_badge, user: current_user)
    @collection14.counter = @count
    @collection14.save

    @pumpkin_badge = Badge.where(name: "Pumpkin")
    @collection15 = Collection.find_by(badge: @pumpkin_badge, user: current_user)
    @collection15.counter = @count
    @collection15.save

    # badges log in

    # badges trees?

    # Badges Ultimes
    @badges = Badge.all
    @ultime_badge = Badge.where(name: "Ultime")
    @collection22 = Collection.find_by(badge: @ultime_badge, user: current_user)
    @collection22.counter = 0
    @badges.each do |badge|
      @collec = Collection.find_by(badge: badge, user: current_user)
      @collection22.counter += 1 if badge.target <= @collec.counter
      @collection22.save
    end
  end
end
