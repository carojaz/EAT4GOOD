# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"
require "nokogiri"

Recipe.destroy_all

for i in (1..4)
  if i == 1
    url = "https://www.allrecipes.com/search/results/?wt=vegetarian"
  else
    url = "https://www.allrecipes.com/search/results/?wt=vegetarian&page=#{i}"
  end

  html = open(url).read
  # 1. Parse HTML
  doc = Nokogiri::HTML(html, nil, "utf-8")

  results = []
  doc.search(".fixed-recipe-card").each do |element|
    # 3. Create recipe and store it in results
    title = element.search(".fixed-recipe-card__title-link").first.text.strip

    introduction = element.search(".fixed-recipe-card__description").first.text.strip

    recipe_url = element.search(".fixed-recipe-card__title-link").first.attribute("href").value

    recipe_html = open(recipe_url).read
    recipe_doc = Nokogiri::HTML(recipe_html, nil, "utf-8")
    prep_time = recipe_doc.search(".recipe-meta-item-body").first.text.strip

    ingredients = []
    recipe_doc.search(".ingredients-item-name").each do |ingredient|
      ingredients << ingredient.text.strip
      ingredients << "@"
    end

    descriptions = []
    recipe_doc.search(".subcontainer.instructions-section-item .section-body").each do |description|
      descriptions << description.text.strip
      descriptions << "@"
    end

    photo = element.search(".fixed-recipe-card__img").attribute("data-original-src").value

    Recipe.create!(title:title, introduction:introduction, ingredients:ingredients.join(', '), description:descriptions.join(', '), preparation_time:prep_time, url_photo:photo)
    puts ".."

  end
end

puts "#{Recipe.count/80*100}% = #{Recipe.count} / 80 challenges created"

User.destroy_all
Friend.destroy_all
Challenge.destroy_all
Challengeset.destroy_all
Breakfast.destroy_all
Lunch.destroy_all
Dinner.destroy_all
Foodtype.destroy_all
Quote.destroy_all
Badge.destroy_all

Quote.create(phrases: "Eat local decrease your CO2 impact :)")
Quote.create(phrases: "Promote carpooling :)")
Quote.create(phrases: "promote  public transport :)")
Quote.create(phrases: "Eat seasonal foods :)")
Quote.create(phrases: "Recycle your waste :)")
Quote.create(phrases: "Don’t waste food :)")
Quote.create(phrases: "Unplug your devices :)")
Quote.create(phrases: "Recycle all you can :)")
Quote.create(phrases: "Try to cut out plastic :)")
Quote.create(phrases: "Use LED light bulbs :)")
Quote.create(phrases: "Insulate your home :)")
Quote.create(phrases: "Fix it, don’t throw it :)")
Quote.create(phrases: "Use eco-friendly cleaning products :)")
# Quote.create(phrases: "Educate: you can help others understand the importance and value of our natural resources :)")
# Quote.create(phrases: "Conserve water: The less water you use, the less runoff and wastewater that eventually end up in the ocean :)")
# Quote.create(phrases: "Shop wisely: Buy less plastic and bring a reusable shopping bag :)")
Quote.create(phrases: "Bike more. Drive less :)")
Quote.create(phrases: "Don't send chemicals into our waterways :)")
Quote.create(phrases: "Promote Biodiversity :)")
Quote.create(phrases: "Don't throw rubbish on the ground :)")
Quote.create(phrases: "Respect nature when you go for a walk :)")
# Quote.create(phrases: "Try stay in a eco-hotel when you go on holiday :)")
Quote.create(phrases: "Choose eco-cosmetics :)")
Quote.create(phrases: "Use mineral sun cream :)")
Quote.create(phrases: "Buy your holidays souvenirs responsibly :)")
Quote.create(phrases: "Support reforestation project :)")
Quote.create(phrases: "Limit light pollution outdoor :)")
Quote.create(phrases: "Don't throw your trash in the sea :)")
Quote.create(phrases: "Reduce your consumption of paper :)")

puts "#{Quote.count/25*100}% = #{Quote.count} / 28 quotes created"

Badge.create(target: 5, name: "Asparagus", description: "Eat 5 veggie meals to get this badge", picture_path: "badge1.svg")
Badge.create(target: 15, name: "Broccoli", description: "Eat 15 veggie meals to get this badge", picture_path: "badge2.svg")
Badge.create(target: 30, name: "Mushroom", description: "Eat 30 veggie meals to get this badge", picture_path: "badge3.svg")
Badge.create(target: 60, name: "Acorn", description: "Eat 60 veggie meals to get this badge", picture_path: "badge10.svg")
Badge.create(target: 120, name: "Apple", description: "Eat 120 veggie meals to get this badge", picture_path: "badge11.svg")
Badge.create(target: 200, name: "Banana", description: "Eat 200 veggie meals to get this badge", picture_path: "badge12.svg")
Badge.create(target: 5, name: "Orange", description: "Take part in 5 challenges to get this badge", picture_path: "badge4.svg")
Badge.create(target: 25, name: "Pineapple", description: "Take part in 25 challenges to get this badge", picture_path: "badge5.svg")
Badge.create(target: 100, name: "Pomegranate", description: "Take part in 100 challenges to get this badge", picture_path: "badge6.svg")
Badge.create(target: 5, name: "Radish", description: "Fill your 3 meals for 5 days to get this badge", picture_path: "badge7.svg")
Badge.create(target: 25, name: "Salad", description: "Fill your 3 meals for 25 days to get this badge", picture_path: "badge8.svg")
Badge.create(target: 100, name: "Tangerine", description: "Fill your 3 meals for 100 days to get this badge", picture_path: "badge9.svg")
Badge.create(target: 10, name: "Corn", description: "Have 10 people in your friends list to get this badge", picture_path: "badge13.svg")
Badge.create(target: 25, name: "Eggplant", description: "Have 25 people in your friends list to get this badge", picture_path: "badge14.svg")
Badge.create(target: 50, name: "Pumpkin", description: "Have 50 people in your friends list to get this badge", picture_path: "badge15.svg")
Badge.create(target: 10, name: "Peach", description: "Log in 10 days to get this badge", picture_path: "badge16.svg")
Badge.create(target: 50, name: "Pear", description: "Log in 50 days to get this badge", picture_path: "badge17.svg")
Badge.create(target: 100, name: "Grapes", description: "Log in 50 days to get this badge", picture_path: "badge18.svg")
# Badge.create(target: 10, name: "Cherry", description: "Save 10 trees to get this badge", picture_path: "badge19.svg")
# Badge.create(target: 50, name: "Carrot", description: "Save 50 trees to get this badge", picture_path: "badge20.svg")
# Badge.create(target: 100, name: "Pepper", description: "Save 100 trees to get this badge", picture_path: "badge21.svg")
Badge.create(target: 18, name: "Ultime", description: "Earn all other badges", picture_path: "badge22.svg")

puts "#{Badge.count/22*100}% = #{Badge.count} / 22 challenges created"

u1 = User.new(first_name: "Caroline" , last_name: "Jasinski", nickname: "Caro", email: "jasinski_caroline@yahoo.fr", password: "azerty" )
file = URI.open('https://avatars3.githubusercontent.com/u/68743949?s=460&u=f16cbc21758c842fba66a642775e7c931a7be251&v=4')
u1.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u1.save!

u2 = User.new(first_name: "Nicholas" , last_name: "Claessens", nickname: "Nicho", email: "nicholas04claessens@yahoo.com", password: "azerty" )
file = URI.open('https://avatars1.githubusercontent.com/u/70324228?s=400&u=4b7e428200c39fee27f4d7ab4956100519065772&v=4')
u2.photo.attach(io: file, filename: 'nicho.jpg', content_type: 'image/jpg')
u2.save!

u3 = User.new(first_name: "Aphisit", last_name: "Chompum", nickname: "Aphi", email: "chompum.aphisit@hotmail.fr", password: "azerty" )
file = URI.open('https://avatars2.githubusercontent.com/u/72460013?s=460&u=f69a8626581d6fbdad07e47bc67a630b6b8aae3a&v=4')
u3.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u3.save!

u4 = User.new(first_name: "Yoda" , last_name: "Baby", nickname: "Yoyo", email: "yoda@baby.com", password: "azerty" )
file = URI.open('https://cdn.tomsguide.fr/content/uploads/sites/2/2020/07/baby-yoda-puppet.jpg')
u4.photo.attach(io: file, filename: 'yoda.jpg', content_type: 'image/jpg')
u4.save!

u5 = User.new(first_name: "François-Xavier" , last_name: "Abraham", nickname: "Big Thumbs", email: "big_thumbs@fingers.com", password: "azerty" )
file = URI.open('https://www.nodal.am/wp-content/uploads/2018/03/PNGPIX-COM-Thumbs-Up-PNG-Transparent-Image-500x848.png')
u5.photo.attach(io: file, filename: 'fx.png', content_type: 'image/png')
u5.save!

u6 = User.new(first_name: "Bob" , last_name: "Razowski", nickname: "Bob", email: "bob@monster.com", password: "azerty" )
file = URI.open('https://www.ladn.eu/wp-content/uploads/2016/10/bob-razowski.jpg')
u6.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
u6.save!

u7 = User.new(first_name: "Zinedine" , last_name: "Zidane", nickname: "Zizou", email: "zizou@france.com", password: "azerty" )
file = URI.open('https://www.podcastjournal.net/photo/art/grande/48501574-38041877.jpg')
u7.photo.attach(io: file, filename: 'zizou.jpg', content_type: 'image/jpg')
u7.save!

u8 = User.new(first_name: "Chat" , last_name: "Roux", nickname: "Garfield", email: "garfield@chat.com", password: "azerty" )
file = URI.open('https://cdn-www.konbini.com/fr/images/files/2016/01/10-of-the-biggest-celebrity-regrets-bill-murray-garfield-810x4851.jpg')
u8.photo.attach(io: file, filename: 'garfield.jpg', content_type: 'image/jpg')
u8.save!

puts "#{User.count/6*100}% = #{User.count} / 6 users created"

f1 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u2.id, status: "OK")
f2 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u3.id, status: "OK")
f3 = Friend.create(friend1_user_id: u2.id, friend2_user_id: u3.id, status: "OK")
f4 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u4.id, status: "OK")
f5 = Friend.create(friend1_user_id: u2.id, friend2_user_id: u5.id, status: "OK")
f6 = Friend.create(friend1_user_id: u3.id, friend2_user_id: u6.id, status: "OK")
f7 = Friend.create(friend1_user_id: u5.id, friend2_user_id: u3.id, status: "OK")
f8 = Friend.create(friend1_user_id: u5.id, friend2_user_id: u1.id, status: "OK")
f9 = Friend.create(friend1_user_id: u5.id, friend2_user_id: u6.id, status: "OK")

puts "#{Friend.count/9*100}% = #{Friend.count} / 9 friends links created"

c1 = Challenge.create!(message: "Pas cap!", nb_days_veggie: 2, nb_days_local: 1 )
c2 = Challenge.create!(message: "Go for challenge!!", nb_days_veggie: 5, nb_days_local: 0 )
c3 = Challenge.create!(message: "100%", nb_days_veggie: 7, nb_days_local: 7 )
c4 = Challenge.create!(message: "local challenge!", nb_days_veggie: 1, nb_days_local: 4 )

puts "#{Challenge.count/4*100}% = #{Challenge.count} / 4 challenges created"

cs1 = Challengeset.create!(challenge_id: c1.id, friend_id: f1.id,start_date: "49", status: "OK")
cs2 = Challengeset.create!(challenge_id: c2.id, friend_id: f2.id,start_date: "50", status: "pending")
cs3 = Challengeset.create!(challenge_id: c3.id, friend_id: f3.id,start_date: "49", status: "KO")
cs4 = Challengeset.create!(challenge_id: c4.id, friend_id: f4.id,start_date: "49", status: "OK")
cs5 = Challengeset.create!(challenge_id: c1.id, friend_id: f5.id,start_date: "49", status: "pending")
cs6 = Challengeset.create!(challenge_id: c2.id, friend_id: f6.id,start_date: "49", status: "pending")
cs7 = Challengeset.create!(challenge_id: c3.id, friend_id: f1.id,start_date: "49", status: "pending")
cs8 = Challengeset.create!(challenge_id: c4.id, friend_id: f2.id,start_date: "49", status: "KO")

puts "#{Challengeset.count/8*100}% = #{Challengeset.count} / 8 challenges created"

ft1 = Foodtype.create!(name: "Dairy")
ft2 = Foodtype.create!(name: "Meat")
ft3 = Foodtype.create!(name: "Fish")
ft4 = Foodtype.create!(name: "Veggie")
ft5 = Foodtype.create!(name: "No meal")

puts "#{Foodtype.count/5*100}% = #{Foodtype.count} / 5 foodtypes created"

Foodtype.all.each do |ft|
  Breakfast.create!(foodtype_id: ft.id, local: true)
  Breakfast.create!(foodtype_id: ft.id, local: false)
  Lunch.create!(foodtype_id: ft.id, local: true)
  Lunch.create!(foodtype_id: ft.id, local: false)
  Dinner.create!(foodtype_id: ft.id, local: true)
  Dinner.create!(foodtype_id: ft.id, local: false)
end
puts "#{Breakfast.count/10*100}% = #{Breakfast.count} / 10 Breakfast created"
puts "#{Lunch.count/10*100}% = #{Lunch.count} / 10 Lunch created"
puts "#{Dinner.count/10*100}% = #{Dinner.count} / 10 Dinner created"

# d1 = Day.new(date: Date.today)
# breakfast = Breakfast.last
# lunch = Lunch.last
# dinner = Dinner.last
# d1.breakfast_id = breakfast.id
# d1.lunch_id = lunch.id
# d1.dinner_id = dinner.id
# d1.user_id = u1.id
# d1.save
# puts "#{Day.count/1*100}% = #{Day.count} / 1 Days created"
