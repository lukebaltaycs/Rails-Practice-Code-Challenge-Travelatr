class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def index
        @post = Post.all

    end

    def new
        @post = Post.new

    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :new
        end

    end

    def edit
        @post = Post.find(params[:id])

    end

    def update
        @post = Post.find(params[:id])
        @post.assign_attributes(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save

        redirect_to post_path(@post)
    end

    private

    def post_params
        params.permit(:title, :content, :likes)
    end

end