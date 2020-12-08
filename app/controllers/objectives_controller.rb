class ObjectivesController < ApplicationController
  def update
    @obj = Objective.find(params[:id])
    if @obj.update(obj_params)
      redirect_to edit_user_registration_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def obj_params
    params.require(:objective).permit(:veggies_days)
  end
end
