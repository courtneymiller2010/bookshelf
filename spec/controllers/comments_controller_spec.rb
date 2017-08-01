require 'spec_helper'

describe CommentsController do
  let(:commentable_object) { create(:book) }
  
  def valid_attributes
    { comment: 'here is a comment', commentable_id: commentable_object.id, 
      commentable_type: commentable_object.class.name }
  end
  

  describe 'POST create' do
    def do_post
      post :create, { comment: valid_attributes }
    end
    
    describe 'with valid params' do
      it 'creates a new Comment' do
        expect {
          do_post
        }.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        do_post
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end
      
      it 'assigns all comments for that object to @comments' do
        do_post
        expect(assigns(:comments)).to eq([assigns(:comment)])
      end

      it 'redirects to the created comment' do
        do_post
        expect(response).to redirect_to(Comment.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Comment).to receive(:save).and_return(false)
        do_post
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Comment).to receive(:save).and_return(false)
        do_post
        expect(response.body).to be_blank
      end
    end
    
    context 'when js' do
      def do_xhr
        xhr :post, :create, comment: valid_attributes
      end
      
      it 'should render create.js.haml' do
        do_xhr
        expect(response).to render_template('comments/create')
      end
    end
  end
end
