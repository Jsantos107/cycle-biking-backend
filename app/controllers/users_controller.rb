class UsersController < ApplicationController
    def index
        render json: {message: "Fuck!"}
    end
    def show
        authenticate 
        render json: {user: @user}, include: [:posts, :checklist_items]
    end

    def create 
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: {user: @user}
    end
end
