class UsersController < ApplicationController
    def show
        @user = User.find(current_user.id)
        @created_events = @user.created_events
    end
end
