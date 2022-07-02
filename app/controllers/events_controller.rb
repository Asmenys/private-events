class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

end
