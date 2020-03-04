class PostsController < ApplicationController
    def index 
        @post = Post.all
        render json: {post: @post}, include: :user
    end
    def show 
        @post = Post.find_by(params[:id])
        render json:{post: @post}
    def create 
        @post = Post.create(
            title: params[:title],
            discription: params[:discription]
        )
        render json: {post: @post}
    end
end
