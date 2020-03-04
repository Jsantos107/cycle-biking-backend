class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        render json: {user: @user}, include: :post
    end

    def create 
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: {user: @user}
    end
end
