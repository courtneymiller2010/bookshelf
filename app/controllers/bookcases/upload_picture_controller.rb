class Bookcases::UploadPictureController < ApplicationController
  before_action :set_bookcase, only: [:edit, :update]
  
  def update
    @bookcase.update_attributes(bookcase_params)
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_bookcase
    @bookcase = Bookcase.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bookcase_params
    params.require(:bookcase).permit(:picture_url)
  end
end
