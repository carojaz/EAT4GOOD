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
    @day.user = current_user.id
    # @day.week = current_week
    @day.save
  end

  def edit
    @day = current_user.day
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
end
