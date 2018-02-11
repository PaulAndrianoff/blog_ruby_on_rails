class CommentController < ApplicationController

    def index
      @comments = Comment.all
    end
  
    def show
      @comments = Comment.order(:created_at).where(post_id: params[:id])
      @post = params[:id]
    end
  
    def new
      @post_id = params[:id]
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.create(params.require(:comment).permit!)
      # redirect_to root_path if comment.persisted?
      # puts @comment.errors.full_messages --> view error
      redirect_to comment_path(params[:comment][:post_id])
    end

    def destroy
      comment = Comment.find(params[:id]).delete
      puts comment.post_id
      redirect_to post_path(comment.post_id)
    end
  
    
end
