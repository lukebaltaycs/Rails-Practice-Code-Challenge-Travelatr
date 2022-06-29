class BloggersController < ApplicationController

    def show
        @blogger = Blogger.find(params[:id])
    end

    def index
        @bloggers = Blogger.all

    end

    def new
        @blogger = Blogger.new

    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :new
        end

    end

    def edit
        @blogger = Blogger.find(params[:id])

    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.assign_attributes(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :edit
        end
    end

    def destroy
        @blogger = Blogger.find(params[:id])
        @blogger.destroy

        redirect_to bloggers_path
    end

    private

    def blogger_params
        params.permit(:name, :bio, :age)
    end

end