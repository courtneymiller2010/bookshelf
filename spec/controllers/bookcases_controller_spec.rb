require 'spec_helper'

describe BookcasesController do
  let!(:bookcase) { create(:bookcase) }

  def valid_attributes
    { name: 'Test Name' }
  end

  describe 'GET index' do
    it 'assigns all bookcases as @bookcases' do
      get :index, {}
      expect(assigns(:bookcases)).to eq([bookcase])
    end
  end

  describe 'GET show' do
    it 'assigns the requested bookcase as @bookcase' do
      get :show, { id: bookcase.to_param }
      expect(assigns(:bookcase)).to eq(bookcase)
    end
  end

  describe 'GET new' do
    it 'assigns a new bookcase as @bookcase' do
      get :new, {}
      expect(assigns(:bookcase)).to be_a_new(Bookcase)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested bookcase as @bookcase' do
      get :edit, { id: bookcase.to_param }
      expect(assigns(:bookcase)).to eq(bookcase)
    end
  end

  describe 'POST create' do
    def do_post
      post :create, { bookcase: valid_attributes }
    end
    
    describe 'with valid params' do
      it 'creates a new Bookcase' do
        expect {
          do_post
        }.to change(Bookcase, :count).by(1)
      end

      it 'assigns a newly created bookcase as @bookcase' do
        do_post
        expect(assigns(:bookcase)).to be_a(Bookcase)
        expect(assigns(:bookcase)).to be_persisted
      end

      it 'redirects to the created bookcase' do
        do_post
        expect(response).to redirect_to(Bookcase.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved bookcase as @bookcase' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Bookcase).to receive(:save).and_return(false)
        do_post
        expect(assigns(:bookcase)).to be_a_new(Bookcase)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Bookcase).to receive(:save).and_return(false)
        do_post
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    def do_put
      put :update, { id: bookcase.to_param, bookcase: valid_attributes }
    end
  
    describe 'with valid params' do
      it 'updates the requested bookcase' do
        # Assuming there are no other bookcases in the database, this
        # specifies that the Bookcase created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Bookcase).to receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: bookcase.to_param, bookcase: { 'these' => 'params' } }
      end

      it 'assigns the requested bookcase as @bookcase' do
        do_put
        expect(assigns(:bookcase)).to eq(bookcase)
      end

      it 'redirects to the bookcase' do
        do_put
        expect(response).to redirect_to(bookcase)
      end
    end

    describe 'with invalid params' do
      it 'assigns the bookcase as @bookcase' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Bookcase).to receive(:save).and_return(false)
        do_put
        expect(assigns(:bookcase)).to eq(bookcase)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Bookcase).to receive(:save).and_return(false)
        do_put
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    def do_delete
      delete :destroy, { id: bookcase.to_param }
    end
    
    it 'destroys the requested bookcase' do
      expect {
        do_delete
      }.to change(Bookcase, :count).by(-1)
    end

    it 'redirects to the bookcases list' do
      do_delete
      expect(response).to redirect_to(bookcases_url)
    end
  end
end
