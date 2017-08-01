require 'spec_helper'

describe Bookcases::UploadPictureController do
  let!(:bookcase) { create(:bookcase) }

  def valid_attributes
    { picture_url: 'https://picture.url/' }
  end
  
  describe 'PUT update' do
    def do_put
      xhr :put, :update, { id: bookcase.to_param, bookcase: valid_attributes }
    end

    it 'assigns the requested bookcase as @bookcase' do
      do_put
      expect(assigns(:bookcase)).to eq(bookcase)
    end

    it 'redirects to the bookcase' do
      do_put
      expect(response).to render_template('update')
    end
  end
end