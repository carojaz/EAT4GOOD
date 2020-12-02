class DaysController < ApplicationController
  def show
    @day = Day.find(params[:id])
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
  end

  def create_previous
    # chercher le jour de l'instance neste
    @date_of_day = Day.find(params[:day_id]).date
    # verifier si le jour -1 existe en base // renvoi un tableau avec 1 valeur
    @day_before = Day.where(date: (@date_of_day - 1), user_id: current_user)

    if @day_before.present?
      # si OK on sort le day de l'array de resultat
      @day_before.first
      redirect_to edit_day_path(@day_before.first)
    else
      # si KO create new day
      set_meals
      @day_before = Day.new(date: @date_of_day - 1)
      @day_before.user_id = current_user.id
      @day_before.breakfast_id = @breakfast.id
      @day_before.lunch_id = @lunch.id
      @day_before.dinner_id = @dinner.id
      @day_before.save
      redirect_to edit_day_path(@day_before)
    end
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

  def edit
    @date_of_day = Day.find(params[:id]).date
  end

  def update
    @day = current_user.day
    # status si 3 repas sont donner
    @day.update(device_params)
    redirect_to day_path
  end

  private

  def device_params
    params.require(:day).permit(:date, :breakfast_id, :lunch_id, :dinner_id)
  end

  def set_meals
    @breakfast = Breakfast.last
    @lunch = Lunch.last
    @dinner = Dinner.last
  end
end
