class PostsController < ApplicationController
    # before_action :authenticate, only:[:create]
    def index 
        @post = Post.all
        render json: {post: @post}, include: :user
    end
    def show 
        @post = Post.find_by(params[:id])
        render json:{post: @post}
    end
    def create 
        @post = Post.create(
            title: params[:title],
            description: params[:description],
            user_id: params[:user_id]
        )
        render json: {post: @post}
    end
    def update
        if @post.update(params[:id])
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render status: 200
      end
end
