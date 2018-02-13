class CommentController < ApplicationController

    def index
      @comments = Comment.all
    end
  
    def show
      @comments = Comment.order(:created_at).where(post_id: params[:id])
      @post = params[:id]
    end

    def edit
      @comment = Comment.find(params[:id])
      @post_id = @comment.user_id
    end 

    def update
      # raise params.inspect
      @comment = Comment.find(params[:id])
      puts @comment
      @comment.update(params.require(:comment).permit!)
      # redirect_to post_path(@comment.post_id)
      
    end
  
    def new
      @post_id = params[:id]
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.create(params.require(:comment).permit!)
      redirect_to comment_path(params[:comment][:post_id])
    end

    def destroy
      comment = Comment.find(params[:id]).delete
      puts comment.post_id
      redirect_to post_path(comment.post_id)
    end
  
    
end
