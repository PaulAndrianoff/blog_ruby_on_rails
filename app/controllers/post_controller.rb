class PostController < ApplicationController  
  
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    
    def index 
      @posts = Post.order(:updated_at).joins(:user).all
    end

    def show
      @comments = @post.comments
      @user = User.find(@post.user_id)
    end
  
    def new
      @post = Post.new
    end

    def edit
    end 

    def update
      @post.update(params.require(:post).permit!)
      redirect_to post_path(@post.id)
    end 
  
    def create
      post = Post.create(params.require(:post).permit!)
      redirect_to root_path if post.persisted?
    end

    def destroy
      @post.destroy
      redirect_to root_path
    end

    private

    def find_post
      if defined?(params[:id])
        @post = Post.find(params[:id])
      end
    end

end
