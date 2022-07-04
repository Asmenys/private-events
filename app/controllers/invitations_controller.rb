class InvitationsController < ApplicationController

    def new
        @invitation = Invitation.new
    end
    
    def create
        @invitation = Invitation.new(invitation_params)
        @invitation.save
        redirect_to Event.find(invitation_params[:event_id])
    end

    private

    def invitation_params
        params.permit(:event_id, :attendee_id)
    end
end
