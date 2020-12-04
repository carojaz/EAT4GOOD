class CollectionsController < ApplicationController
  def index
    @collections = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
  end
end
