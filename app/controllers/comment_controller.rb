class CommentController < ApplicationController

    def index
      @jobs = Job.all
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      @post = Post.new
    end
  
    def create
      post = Post.create(params[:job].permit!)
      redirect_to root_path if post.persisted?
    end
    
    private

    def find_users_posts
        @posts = Post.find_by user_id: params[:id]
    end

end
