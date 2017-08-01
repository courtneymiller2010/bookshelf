class MovieDecorator < Draper::Decorator
  delegate_all
  
  def bookcase
    object.bookcase || NullBookcase.new
  end
end