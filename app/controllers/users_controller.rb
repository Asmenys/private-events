class UsersController < ApplicationController
    def show
        @hosted_events = @user.hosted_events
    end
end
