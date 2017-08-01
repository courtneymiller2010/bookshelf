require 'spec_helper'

describe MoviesController do
  let!(:movie) { create(:movie) }

  def valid_attributes
    { name: 'Test Name' }
  end

  describe 'GET index' do
    it 'assigns all movies as @movies' do
      get :index, {}
      expect(assigns(:movies)).to eq([movie])
    end
  end

  describe 'GET show' do
    it 'assigns the requested movie as @movie' do
      get :show, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
      expect(assigns(:movie)).to be_instance_of(MovieDecorator)
    end
  end

  describe 'GET new' do
    it 'assigns a new movie as @movie' do
      get :new, {}
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested movie as @movie' do
      get :edit, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
      expect(assigns(:movie)).to be_instance_of(MovieDecorator)
    end
  end

  describe 'POST create' do
    def do_post
      post :create, { movie: valid_attributes }
    end
    
    describe 'with valid params' do
      it 'creates a new Movie' do
        expect {
          do_post
        }.to change(Movie, :count).by(1)
      end

      it 'assigns a newly created movie as @movie' do
        do_post
        expect(assigns(:movie)).to be_a(Movie)
        expect(assigns(:movie)).to be_persisted
      end

      it 'redirects to the created movie' do
        do_post
        expect(response).to redirect_to(Movie.last)
      end
      
      it 'calls out to gather more information' do
        double_service = double(GatherMovieInfoService)
        expect(GatherMovieInfoService).to receive(:new).and_return(double_service)
        expect(double_service).to receive_message_chain(:delay, :gather).and_return(true)
        
        do_post
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved movie as @movie' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        do_post
        expect(assigns(:movie)).to be_a_new(Movie)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        do_post
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    def do_put
      put :update, { id: movie.to_param, movie: valid_attributes }
    end
  
    describe 'with valid params' do
      it 'updates the requested movie' do
        # Assuming there are no other movies in the database, this
        # specifies that the Movie created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Movie).to receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: movie.to_param, movie: { 'these' => 'params' } }
      end

      it 'assigns the requested movie as @movie' do
        do_put
        expect(assigns(:movie)).to eq(movie)
        expect(assigns(:movie)).to be_instance_of(MovieDecorator)
      end

      it 'redirects to the movie' do
        do_put
        expect(response).to redirect_to(movie)
      end
    end

    describe 'with invalid params' do
      it 'assigns the movie as @movie' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        do_put
        expect(assigns(:movie)).to eq(movie)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        do_put
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    def do_delete
      delete :destroy, { id: movie.to_param }
    end
    
    it 'destroys the requested movie' do
      expect {
        do_delete
      }.to change(Movie, :count).by(-1)
    end

    it 'redirects to the movies list' do
      do_delete
      expect(response).to redirect_to(movies_url)
    end
  end
end
