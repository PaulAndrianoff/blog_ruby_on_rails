class PostController < ApplicationController   
    
    def index 
      @posts = Post.joins(:user).order(:updated_at).all
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

end
