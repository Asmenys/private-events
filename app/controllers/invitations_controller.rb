class InvitationsController < ApplicationController

    def new
        @invitation = Invitation.new
    end
    
    def create
        @invitation = Invitation.new(invitation_params)
        @invitation.save
    end

    private

    def invitation_params
        params.permit(:event_id, :attendee_id)
    end
end
