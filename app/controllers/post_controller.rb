class PostController < ApplicationController   
    
    def index 
        temp = User.all
        id = params[:id]? params[:id] : rand(1..temp.count)
        
        @posts = Post.where(user_id: id)
        @user = User.find(id)
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
    
    def find_users_posts
        
    end

end
