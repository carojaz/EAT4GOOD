class CollectionsController < ApplicationController
  def index
    @collections = Badge.all
  end
end
