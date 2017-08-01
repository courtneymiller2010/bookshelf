require 'spec_helper'

describe ActorsController do
  let!(:actor) { create(:actor) }

  def valid_attributes
    { name: 'Test Name' }
  end

  describe 'GET index' do
    it 'assigns all actors as @actors' do
      get :index, {}
      expect(assigns(:actors)).to eq([actor])
    end
  end

  describe 'GET show' do
    it 'assigns the requested actor as @actor' do
      get :show, { id: actor.to_param }
      expect(assigns(:actor)).to eq(actor)
    end
  end

  describe 'GET new' do
    it 'assigns a new actor as @actor' do
      get :new, {}
      expect(assigns(:actor)).to be_a_new(Actor)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested actor as @actor' do
      get :edit, { id: actor.to_param }
      expect(assigns(:actor)).to eq(actor)
    end
  end

  describe 'POST create' do
    def do_post
      post :create, { actor: valid_attributes }
    end
    
    describe 'with valid params' do
      it 'creates a new Actor' do
        expect {
          do_post
        }.to change(Actor, :count).by(1)
      end

      it 'assigns a newly created actor as @actor' do
        do_post
        expect(assigns(:actor)).to be_a(Actor)
        expect(assigns(:actor)).to be_persisted
      end

      it 'redirects to the created actor' do
        do_post
        expect(response).to redirect_to(Actor.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved actor as @actor' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Actor).to receive(:save).and_return(false)
        do_post
        expect(assigns(:actor)).to be_a_new(Actor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Actor).to receive(:save).and_return(false)
        do_post
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    def do_put
      put :update, { id: actor.to_param, actor: valid_attributes }
    end
  
    describe 'with valid params' do
      it 'updates the requested actor' do
        # Assuming there are no other actors in the database, this
        # specifies that the Actor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Actor).to receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: actor.to_param, actor: { 'these' => 'params' } }
      end

      it 'assigns the requested actor as @actor' do
        do_put
        expect(assigns(:actor)).to eq(actor)
      end

      it 'redirects to the actor' do
        do_put
        expect(response).to redirect_to(actor)
      end
    end

    describe 'with invalid params' do
      it 'assigns the actor as @actor' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Actor).to receive(:save).and_return(false)
        do_put
        expect(assigns(:actor)).to eq(actor)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Actor).to receive(:save).and_return(false)
        do_put
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    def do_delete
      delete :destroy, { id: actor.to_param }
    end
    
    it 'destroys the requested actor' do
      expect {
        do_delete
      }.to change(Actor, :count).by(-1)
    end

    it 'redirects to the actors list' do
      do_delete
      expect(response).to redirect_to(actors_url)
    end
  end
end
