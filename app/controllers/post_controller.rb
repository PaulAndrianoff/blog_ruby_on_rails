class PostController < ApplicationController   
    
    def index
        @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
    end
  
    def new
      @post = Post.new
    end
  
    def create
      puts(params[:post])
      post = Post.create(params[:post].permit!)
      redirect_to root_path if post.persisted?
    end
    
    private

    def find_users_posts
        @posts = Post.find_by user_id: params[:id]
    end

end
