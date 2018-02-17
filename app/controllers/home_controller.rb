class HomeController < ApplicationController

    skip_before_action :authenticate_user!, only: :index

    def index
        if user_signed_in?
            @posts = Post.all.where(user_id: current_user)
        else
            @posts = Post.last(3)
        end
    end

    def show
        puts params
        I18n.locale = params[:id] || I18n.default_locale
        redirect_back(fallback_location: root_path)
    end

end
