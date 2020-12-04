class DaysController < ApplicationController
  # after :authenticate_user!

  def show
    set_days
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
    # status si 3 repas sont donner
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
      params[:previous_action] == "edit" ? redirect_to(edit_day_path(@day_before)) : redirect_to(day_path(@day_before))
    end
  end

  def next_day
    # chercher le jour de l'instance neste
    @date_of_day = Day.find(params[:day_id]).date
    # verifier si le jour -1 existe en base // renvoi un tableau avec 1 valeur
    @day_after = Day.where(date: (@date_of_day + 1), user_id: current_user).first
    params[:previous_action] == "edit" ? redirect_to(edit_day_path(@day_after)) : redirect_to(day_path(@day_after))
  end

  def status
    # faire le calcul du scoring du jour
    @veggie_foodtype = Foodype.find(name: "Veggie")
    if @day.breakfast.foodtype_id == @veggie_foodtype.id
      veggie_counter += 1
    end
    if @day.lunch.foodtype_id == @veggie_foodtype.id
      veggie_counter += 1
    end
    if @day.dinner.foodtype_id == @veggie_foodtype.id
      veggie_counter += 1
    end
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
    @day = Day.find(params[:id])
    @date_of_day = @day.date
  end
end
