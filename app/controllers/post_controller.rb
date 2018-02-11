class PostController < ApplicationController   
    
    def index 
      @posts = Post.order(:updated_at).joins(:user).all
    end

    def show
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
    end
  
    def new
      @post = Post.new
    end
  
    def create
      post = Post.create(params[:post].permit!)
      redirect_to root_path if post.persisted?
    end

    def destroy
      post = Post.find(params[:id]).delete
      redirect_to root_path
    end

end
