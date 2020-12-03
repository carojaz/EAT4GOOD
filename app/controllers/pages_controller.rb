class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      date_of_day = Day.where(date: Date.today, user: current_user).first
      date_of_day.present? ? redirect_to(day_path(date_of_day)) : redirect_to(create_day_path)
    end
  end
end
