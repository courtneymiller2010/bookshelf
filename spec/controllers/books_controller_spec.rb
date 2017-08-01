require 'spec_helper'

describe BooksController do
  let!(:book) { create(:book) }

  def valid_attributes
    { name: 'Test Name' }
  end

  describe 'GET index' do
    it 'assigns all books as @books' do
      get :index, {}
      expect(assigns(:books)).to eq([book])
    end
  end

  describe 'GET show' do
    it 'assigns the requested book as @book' do
      get :show, { id: book.to_param }
      expect(assigns(:book)).to eq(book)
      expect(assigns(:book)).to be_instance_of(BookDecorator)
    end
  end

  describe 'GET new' do
    it 'assigns a new book as @book' do
      get :new, {}
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested book as @book' do
      get :edit, { id: book.to_param }
      expect(assigns(:book)).to eq(book)
      expect(assigns(:book)).to be_instance_of(BookDecorator)
    end
  end

  describe 'POST create' do
    def do_post
      post :create, { book: valid_attributes }
    end
    
    describe 'with valid params' do
      it 'creates a new Book' do
        expect {
          do_post
        }.to change(Book, :count).by(1)
      end

      it 'assigns a newly created book as @book' do
        do_post
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it 'redirects to the created book' do
        do_post
        expect(response).to redirect_to(Book.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved book as @book' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Book).to receive(:save).and_return(false)
        do_post
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Book).to receive(:save).and_return(false)
        do_post
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    def do_put
      put :update, { id: book.to_param, book: valid_attributes }
    end
  
    describe 'with valid params' do
      it 'updates the requested book' do
        # Assuming there are no other books in the database, this
        # specifies that the Book created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Book).to receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: book.to_param, book: { 'these' => 'params' } }
      end

      it 'assigns the requested book as @book' do
        do_put
        expect(assigns(:book)).to eq(book)
        expect(assigns(:book)).to be_instance_of(BookDecorator)
      end

      it 'redirects to the book' do
        do_put
        expect(response).to redirect_to(book)
      end
    end

    describe 'with invalid params' do
      it 'assigns the book as @book' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Book).to receive(:save).and_return(false)
        do_put
        expect(assigns(:book)).to eq(book)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Book).to receive(:save).and_return(false)
        do_put
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    def do_delete
      delete :destroy, { id: book.to_param }
    end
    
    it 'destroys the requested book' do
      expect {
        do_delete
      }.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      do_delete
      expect(response).to redirect_to(books_url)
    end
  end
end
