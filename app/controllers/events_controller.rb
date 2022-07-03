class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @user = User.find(current_user.id)
        @event = @user.created_events.new(event_params)
        if @event.save
            redirect_to user_path(current_user.id)
        else
            render 'new', status: :unprocessable_entity
        end
    end 

    private

    def event_params
        params.require(:event).permit(:location, :creator_id, :title, :body, :event_date)
    end
end
