class VisitorsController < ApplicationController
  def index
    @bookcases = Bookcase.all
  end
end
