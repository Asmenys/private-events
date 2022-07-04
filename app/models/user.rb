class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :created_events, class_name: "Event", inverse_of: 'creator', foreign_key: "creator_id", dependent: :destroy

         has_many :invitations, foreign_key: :attendee_id
         has_many :attended_events, through: :invitations, source: :event


  def attends_event?(event_id)
    result = false
    invitations = self.invitations
    invitations.each do |invitation|
      if invitation.event_id == event_id
        result = true
        break
      end
    end
    result
  end
end
