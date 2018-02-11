class HomeController < ApplicationController

    def index
        if user_signed_in?
            @posts = Post.all.where(user_id: current_user)
        else
            @posts = Post.last(3)
        end
    end

end
