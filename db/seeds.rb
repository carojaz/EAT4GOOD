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

for i in (1..2)
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

    recipe_url = element.search(".fixed-recipe-card__title-link").first.attribute("href").value

    recipe_html = open(recipe_url).read
    recipe_doc = Nokogiri::HTML(recipe_html, nil, "utf-8")
    prep_time = recipe_doc.search(".recipe-meta-item-body").first.text.strip

    ingredients = []
    recipe_doc.search(".ingredients-item-name").each do |ingredient|
      ingredients << ingredient.text.strip
    end

    descriptions = []
    recipe_doc.search(".subcontainer.instructions-section-item .section-body").each do |description|
      descriptions << description.text.strip
    end

    photo = element.search(".fixed-recipe-card__img").attribute("data-original-src").value

    Recipe.create!(title:title, ingredients:ingredients.join(', '), description:descriptions.join(', '), preparation_time:prep_time, url_photo:photo)
    p "une recette crée"
  end
end



User.destroy_all
Friend.destroy_all
Challenge.destroy_all
Challengeset.destroy_all

u1 = User.new(first_name: "Caroline" , last_name: "Jasinski", nickname: "Caro", email: "jasinski_caroline@yahoo.fr", password: "azerty" )
# file = URI.open('https://avatars3.githubusercontent.com/u/68743949?s=460&u=f16cbc21758c842fba66a642775e7c931a7be251&v=4')
# u1.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u1.save!

u2 = User.new(first_name: "Nicholas" , last_name: "Claessens", nickname: "Nicho", email: "nicholas04claessens@yahoo.com", password: "azerty" )
# file = URI.open('https://avatars1.githubusercontent.com/u/70324228?s=400&u=4b7e428200c39fee27f4d7ab4956100519065772&v=4')
# u2.photo.attach(io: file, filename: 'nicho.jpg', content_type: 'image/jpg')
u2.save!

u3 = User.new(first_name: "Aphisit", last_name: "Chompum", nickname: "Aphi", email: "chompum.aphisit@hotmail.fr", password: "azerty" )
# file = URI.open('https://avatars2.githubusercontent.com/u/72460013?s=460&u=f69a8626581d6fbdad07e47bc67a630b6b8aae3a&v=4')
# u3.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u3.save!

u4 = User.new(first_name: "Yoda" , last_name: "Baby", nickname: "Yoyo", email: "yoda@baby.com", password: "azerty" )
# file = URI.open('https://cdn.tomsguide.fr/content/uploads/sites/2/2020/07/baby-yoda-puppet.jpg')
# u4.photo.attach(io: file, filename: 'yoda.jpg', content_type: 'image/jpg')
u4.save!

u5 = User.new(first_name: "François-Xavier" , last_name: "Abraham", nickname: "Big Thumbs", email: "big_thumbs@fingers.com", password: "azerty" )
# file = URI.open('https://www.pngfind.com/pngs/m/24-243739_thumbs-up-png-transparent-image-thumbs-up-image.png')
# u5.photo.attach(io: file, filename: 'fx.png', content_type: 'image/png')
u5.save!

u6 = User.new(first_name: "Bob" , last_name: "Razowski", nickname: "Bob", email: "bob@monster.com", password: "azerty" )
# file = URI.open('https://www.ladn.eu/wp-content/uploads/2016/10/bob-razowski.jpg')
# u6.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
u6.save!

puts "#{User.count/6*100}% = #{User.count} / 6 users created"

f1 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u2.id, status: "OK")
f2 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u3.id, status: "OK")
f3 = Friend.create(friend1_user_id: u2.id, friend2_user_id: u3.id, status: "OK")
f4 = Friend.create(friend1_user_id: u1.id, friend2_user_id: u4.id, status: "OK")
f5 = Friend.create(friend1_user_id: u2.id, friend2_user_id: u5.id, status: "OK")
f6 = Friend.create(friend1_user_id: u3.id, friend2_user_id: u6.id, status: "OK")

puts "#{Friend.count/6*100}% = #{Friend.count} / 6 friends links created"

c1 = Challenge.create!(message: "Pas cap!", nb_days_veggie: 2, nb_days_local: 1 )
c2 = Challenge.create!(message: "Go for challenge!!", nb_days_veggie: 5, nb_days_local: 0 )
c3 = Challenge.create!(message: "100%", nb_days_veggie: 7, nb_days_local: 7 )
c4 = Challenge.create!(message: "local challenge!", nb_days_veggie: 0, nb_days_local: 4 )

puts "#{Challenge.count/4*100}% = #{Challenge.count} / 4 challenges created"

cs1 = Challengeset.create!(challenge_id: c1.id, friend_id: f1.id,start_date: "2020-12-07", status: "OK")
cs2 = Challengeset.create!(challenge_id: c2.id, friend_id: f2.id,start_date: "2020-12-07", status: "pending")
cs3 = Challengeset.create!(challenge_id: c3.id, friend_id: f3.id,start_date: "2020-12-07", status: "KO")
cs4 = Challengeset.create!(challenge_id: c4.id, friend_id: f4.id,start_date: "2020-12-07", status: "OK")
cs5 = Challengeset.create!(challenge_id: c1.id, friend_id: f5.id,start_date: "2020-12-07", status: "pending")
cs6 = Challengeset.create!(challenge_id: c2.id, friend_id: f6.id,start_date: "2020-12-07", status: "pending")
cs7 = Challengeset.create!(challenge_id: c3.id, friend_id: f1.id,start_date: "2020-12-07", status: "pending")
cs8 = Challengeset.create!(challenge_id: c4.id, friend_id: f2.id,start_date: "2020-12-07", status: "KO")

puts "#{Challengeset.count/8*100}% = #{Challengeset.count} / 8 challenges created"
