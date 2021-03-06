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

    @acorn_badge = Badge.where(name: "Acorn")
    @collection10 = Collection.find_by(badge: @acorn_badge, user: current_user)
    @collection10.counter = 0

    @apple_badge = Badge.where(name: "Apple")
    @collection11 = Collection.find_by(badge: @apple_badge, user: current_user)
    @collection11.counter = 0

    @banana_badge = Badge.where(name: "Banana")
    @collection12 = Collection.find_by(badge: @banana_badge, user: current_user)
    @collection12.counter = 0

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

      @collection10.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection10.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection10.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection10.save

      @collection11.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection11.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection11.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection11.save

      @collection12.counter += 1 if day.breakfast.foodtype.name == "Veggie"
      @collection12.counter += 1 if day.lunch.foodtype.name == "Veggie"
      @collection12.counter += 1 if day.dinner.foodtype.name == "Veggie"
      @collection12.save
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

    @pomegranate_badge = Badge.where(name: "Pomegran")
    @collection6 = Collection.find_by(badge: @pomegranate_badge, user: current_user)
    @collection6.counter = counter
    @collection6.save

    # badges fill meals
    @days = Day.where(user: current_user).to_a

    @radish_badge = Badge.where(name: "Radish")
    @collection7 = Collection.find_by(badge: @radish_badge, user: current_user)
    @collection7.counter = 0

    @salad_badge = Badge.where(name: "Salad")
    @collection8 = Collection.find_by(badge: @salad_badge, user: current_user)
    @collection8.counter = 0

    @tangerine_badge = Badge.where(name: "Tangerine")
    @collection9 = Collection.find_by(badge: @tangerine_badge, user: current_user)
    @collection9.counter = 0

    @days.each do |day|
      @collection7.counter += 1 if (day.breakfast.foodtype.name != "No meal") && (day.lunch.foodtype.name != "No meal") && (day.dinner.foodtype.name != "No meal")
      @collection7.save

      @collection8.counter += 1 if (day.breakfast.foodtype.name != "No meal") && (day.lunch.foodtype.name != "No meal") && (day.dinner.foodtype.name != "No meal")
      @collection8.save

      @collection9.counter += 1 if (day.breakfast.foodtype.name != "No meal") && (day.lunch.foodtype.name != "No meal") && (day.dinner.foodtype.name != "No meal")
      @collection9.save
    end

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

    # badges login

    array_date = []
    @compteur = 0
    date = Date.today
    unless array_date.include? date
      @compteur += 1
      array_date << date
    end

    @peach_badge = Badge.where(name: "Peach")
    @collection16 = Collection.find_by(badge: @peach_badge, user: current_user)
    @collection16.counter = @compteur
    @collection16.save

    @pear_badge = Badge.where(name: "Pear")
    @collection17 = Collection.find_by(badge: @pear_badge, user: current_user)
    @collection17.counter = @compteur
    @collection17.save

    @grapes_badge = Badge.where(name: "Grapes")
    @collection18 = Collection.find_by(badge: @grapes_badge, user: current_user)
    @collection18.counter = @compteur
    @collection18.save

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
