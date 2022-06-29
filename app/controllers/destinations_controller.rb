class DestinationsController < ApplicationController


    def index
        @destinations = Destination.all

    end

    def show
        @destination = Destination.find(params[:id])
        @posts_l = @destination.posts.order(:likes).reverse
        @posts_t = @destination.posts.reverse.first(5)
    end

    

    def new
        @destination = Destination.new

    end

    def create
        @destination = Destination.new(blogger_params)
        if @destination.valid?
            @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end

    end

    def edit
        @destination = Destination.find(params[:id])

    end

    def update
        @destination = Destination.find(params[:id])
        @destination.assign_attributes(destination_params)
        if @destination.valid?
            @destination.save
            redirect_to destination_path(@destination)
        else
            render :edit
        end
    end

    def destroy
        @destination = Destination.find(params[:id])
        @destination.destroy

        redirect_to destinations_path
    end

    private

    def destination_params
        params.permit(:name, :country)
    end

end