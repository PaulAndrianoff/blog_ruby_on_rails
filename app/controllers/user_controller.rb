class UserController < ApplicationController

    def index
        @users = User.all
    end

    def show
        id = params[:id]
        @posts = Post.where(user_id: id)
        @user = User.find(id)
    end
end
