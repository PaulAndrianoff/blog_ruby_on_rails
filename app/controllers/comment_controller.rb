class CommentController < ApplicationController

    before_action :find_comment, only: [:edit, :update, :destroy]

    def index
      @comments = Comment.all
    end
  
    def show
      @comments = Comment.order(:created_at).where(post_id: params[:id])
      @post = params[:id]
    end

    def edit
    end 

    def update
      @comment.update(params.require(:comment).permit!)
      redirect_to post_path(@comment.post_id)
    end
  
    def new
      @post_id = params[:id]
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.create(params.require(:comment).permit!)
      redirect_to post_path(params[:comment][:post_id])
    end

    def destroy
      @comment.delete
      puts @comment.post_id
      redirect_to post_path(@comment.post_id)
    end
  
    private

    def find_comment
      if defined?(params[:id])
        @comment = Comment.find(params[:id])
      end
    end
    
end
