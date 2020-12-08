class DaysController < ApplicationController
  # after :authenticate_user!

  def show
    set_days
    week_analysis
    co2_analysis
    m2_analysis
    h2o_analysis
    month_analysis
  end

  def new
    # Faire en sorte de generer un day a la 1ere connection de la journee
    @day = Day.new
  end

  def create
    @day = Day.new(date: Date.today)
    @day.user_id = current_user.id
    # methode d'instance pour un day
    set_meals

    @day.breakfast_id = @breakfast.id
    @day.lunch_id = @lunch.id
    @day.dinner_id = @dinner.id

    @day.save
    @day_for_week_set = @day
    set_obj
    week_analysis
    co2_analysis
    m2_analysis
    h2o_analysis
    month_analysis
    redirect_to(day_path(@day))
  end

  def edit
    set_days
    @breakfast = @day.breakfast.foodtype.name
    @lunch = @day.lunch.foodtype.name
    @dinner = @day.dinner.foodtype.name
  end

  def update
    set_days
    foodtype = Foodtype.find_by(name: params[:foodtype])
    if params[:meal] == "breakfast"
      @day.breakfast = Breakfast.find_by(foodtype_id: foodtype)
    elsif params[:meal] == "lunch"
      @day.lunch = Lunch.find_by(foodtype_id: foodtype)
    else
      @day.dinner = Dinner.find_by(foodtype_id: foodtype)
    end
    @day.save
    redirect_to edit_day_path(@day)
  end

  def create_previous
    # chercher le jour de l'instance neste
    @date_of_day = Day.find(params[:day_id]).date
    # verifier si le jour -1 existe en base // renvoi un tableau avec 1 valeur
    @day_before = Day.where(date: (@date_of_day - 1), user_id: current_user)

    if @day_before.present?
      # si OK on sort le day de l'array de resultat
      @day_before.first
      params[:previous_action] == "edit" ? redirect_to(edit_day_path(@day_before.first)) : redirect_to(day_path(@day_before.first))
    else
      # si KO create new day
      set_meals
      @day_before = Day.new(date: @date_of_day - 1)
      @day_before.user_id = current_user.id
      @day_before.breakfast_id = @breakfast.id
      @day_before.lunch_id = @lunch.id
      @day_before.dinner_id = @dinner.id
      @day_before.save
      @day_for_week_set = @day_before
      set_obj
      week_analysis
      co2_analysis
      h2o_analysis
      month_analysis
      params[:previous_action] == "edit" ? redirect_to(edit_day_path(@day_before)) : redirect_to(day_path(@day_before))
    end
  end

  def next_day
    # chercher le jour de l'instance neste
    @date_of_day = Day.find(params[:day_id]).date
    # verifier si le jour -1 existe en base // renvoi un tableau avec 1 valeur
    @day_after = Day.where(date: (@date_of_day + 1), user_id: current_user).first
    @day_for_week_set = @day_after
    week_analysis
    co2_analysis
    m2_analysis
    h2o_analysis
    month_analysis
    params[:previous_action] == "edit" ? redirect_to(edit_day_path(@day_after)) : redirect_to(day_path(@day_after))
  end

  private

  def day_params
    params.require(:day).permit(:date, :breakfast_id, :lunch_id, :dinner_id, :foodtype)
  end

  def set_meals
    @breakfast = Breakfast.last
    @lunch = Lunch.last
    @dinner = Dinner.last
  end

  def set_days
    if params[:id].present?
      @day = Day.find(params[:id])
      @date_of_day = @day.date
    elsif params[:day_id].present?
      @day = Day.find(params[:day_id])
      @date_of_day = @day.date
    end
  end

  def set_week_year
    if @date_of_day.present?
      @week = @date_of_day.cweek
      @year = @date_of_day.year
    end
  end

  def set_obj
    @year = @day_for_week_set.date.year
    @week = @day_for_week_set.date.cweek
    @week_before = @week - 1

    @obj_of_week = Objective.find_by(year: @year, nb_week: @week, user_id: current_user.id)
    @obj_week_before = Objective.find_by(year: @year, nb_week: @week_before, user_id: current_user.id)
    if @obj_week_before.present? && @obj_week_before.veggies_days > 0
      @veggies_days = @obj_week_before.veggies_days
    else
      @veggies_days = 0
    end

    if @obj_of_week.nil?
      @obj_of_week = Objective.new(year: @year, nb_week: @week, user_id: current_user.id, veggies_days: @veggies_days)
    else
      @obj_of_week.veggies_days = @veggies_days
    end
    @obj_of_week.save
  end

  def set_analysis_scope
    # 1 recuperer  date
    set_days
    # 2 calcul du num de semaine
    set_week_year
    # 3 recuperer l'objectif de la semaine (instance)
    @obj = Objective.where(nb_week: @week, year: @year, user_id: current_user.id)
    @obj_veggie = @obj.first.veggies_days
    # 4 trouver les jours de la semaine
    @week_start = Date.commercial(@year, @week, 1)
    @week_end = Date.commercial(@year, @week, 7)
    # 5 recuperer un array des instances correspondant a la semaine
    @days_of_week = current_user.days.where(date: @week_start..@week_end).to_a
  end

  def count_veggie
    # 6 recuperer veggie footype id
    # @veggie = Foodtype.find_by(name: "Veggie")
    # 7 calculer le nb de veggie cette semaine
    @veggie_this_week = 0
    @days_of_week.each do |day|
      @veggie_this_week += 1 if day.breakfast.foodtype.name == "Veggie"
      @veggie_this_week += 1 if day.lunch.foodtype.name == "Veggie"
      @veggie_this_week += 1 if day.dinner.foodtype.name == "Veggie"
    end
  end

  def count_meat
    # 6 recuperer veggie footype id
    # @veggie = Foodtype.find_by(name: "Veggie")
    # 7 calculer le nb de veggie cette semaine
    @meat_this_week = 0
    @days_of_week.each do |day|
      @meat_this_week += 1 if day.breakfast.foodtype.name == "Meat"
      @meat_this_week += 1 if day.lunch.foodtype.name == "Meat"
      @meat_this_week += 1 if day.dinner.foodtype.name == "Meat"
    end
  end

  def count_fish
    # 6 recuperer veggie footype id
    # @veggie = Foodtype.find_by(name: "Veggie")
    # 7 calculer le nb de veggie cette semaine
    @fish_this_week = 0
    @days_of_week.each do |day|
      @fish_this_week += 1 if day.breakfast.foodtype.name == "Fish"
      @fish_this_week += 1 if day.lunch.foodtype.name == "Fish"
      @fish_this_week += 1 if day.dinner.foodtype.name == "Fish"
    end
  end

  def count_dairy
    # 6 recuperer veggie footype id
    # @veggie = Foodtype.find_by(name: "Veggie")
    # 7 calculer le nb de veggie cette semaine
    @dairy_this_week = 0
    @days_of_week.each do |day|
      @dairy_this_week += 1 if day.breakfast.foodtype.name == "Dairy"
      @dairy_this_week += 1 if day.lunch.foodtype.name == "Dairy"
      @dairy_this_week += 1 if day.dinner.foodtype.name == "Dairy"
    end
  end

  def count_fasting
    # 6 recuperer veggie footype id
    # @veggie = Foodtype.find_by(name: "Veggie")
    # 7 calculer le nb de veggie cette semaine
    @fasting_this_week = 0
    @days_of_week.each do |day|
      @fasting_this_week += 1 if day.breakfast.foodtype.name == "No meal"
      @fasting_this_week += 1 if day.lunch.foodtype.name == "No meal"
      @fasting_this_week += 1 if day.dinner.foodtype.name == "No meal"
    end
  end

  def week_analysis
    set_analysis_scope
    count_veggie
    # 8 statistique de la semaine
    if @obj_veggie.zero? && @veggie_this_week.zero?
      @week_status = 0
    elsif @obj_veggie.zero? && @veggie_this_week > 0
      @week_status = 110
    else
      @week_status = ((@veggie_this_week.to_f / @obj_veggie.to_f) * 100).to_i
    end
  end

  def day_status
    @day = Day.find_by(date: Date.today)
  end

  def co2_analysis
    set_analysis_scope
    @full_meat = 960 * 3
    @co2_today = 0
    @meals = []
    @meals << @day.breakfast.foodtype.name
    @meals << @day.lunch.foodtype.name
    @meals << @day.dinner.foodtype.name
    @meals.each do |meal|
      @co2_today += 0 if meal == "No meal"
      @co2_today += 130 if meal == "Veggie"
      @co2_today += 555 if meal == "Dairy"
      @co2_today += 665 if meal == "Fish"
      @co2_today += 960 if meal == "Meat"
    end
    @eco_co2_day = 100 - ((@co2_today.to_f / @full_meat.to_f) * 100).round
  end

  def m2_analysis
    set_analysis_scope
    @full_meat_m2 = 9.9 * 3
    @m2_today = 0
    @meals = []
    @meals << @day.breakfast.foodtype.name
    @meals << @day.lunch.foodtype.name
    @meals << @day.dinner.foodtype.name
    @meals.each do |meal|
      @m2_today += 0 if meal == "No meal"
      @m2_today += 1.2 if meal == "Veggie"
      @m2_today += 8.7 if meal == "Dairy"
      @m2_today += 9.1 if meal == "Fish"
      @m2_today += 9.9 if meal == "Meat"
    end
    @eco_m2_day = (@full_meat_m2 - @m2_today).round(1)
    @eco_m2_day_percentage = ((@eco_m2_day.to_f / @full_meat_m2.to_f) * 100).round
  end

  def h2o_analysis
    set_analysis_scope
    @full_meat_h2o = 5166 * 3
    @h2o_today = 0
    @meals = []
    @meals << @day.breakfast.foodtype.name
    @meals << @day.lunch.foodtype.name
    @meals << @day.dinner.foodtype.name
    @meals.each do |meal|
      @h2o_today += 0 if meal == "No meal"
      @h2o_today += 1800 if meal == "Veggie"
      @h2o_today += 340 if meal == "Dairy"
      @h2o_today += 4000 if meal == "Fish"
      @h2o_today += 5166 if meal == "Meat"
    end
    @eco_h2o_day = (@full_meat_h2o - @h2o_today).round(1)
    @eco_h2o_day_percentage = ((@eco_h2o_day.to_f / @full_meat_h2o.to_f) * 100).round
  end

  def month_calendar
    if @date_of_day
      @year_w = @date_of_day.year
    else
      @year_w = @day.year
    end
    # semaine actuelle
    @nb_week_w0 = @date_of_day.cweek
    @nb_week_w3 = @nb_week_w0 - 3
    @week_end_w0 = Date.commercial(@year_w, @nb_week_w0, 7)
    @week_start_w3 = Date.commercial(@year_w, @nb_week_w3, 1)
    @days_of_period_user = current_user.days.where(date: @week_start_w3..@week_end_w0).to_a

    # toutes les dates de la periode
    @days_of_period = (@week_start_w3..@week_end_w0)
  end

  def month_analysis
    month_calendar
    @day_status = Hash.new(0)
    @days_of_period.each do |day|
      @user_day = @days_of_period_user.find { |day2| day2.date == day }
      if @user_day.nil?
        @day_status[day] = -1
      else
        @day_status[day] = @user_day.veggie_per_day
      end
    end
  end
end
