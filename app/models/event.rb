class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    has_many :invitations, foreign_key: :event_id
    has_many :attendees, through: :invitations
   
    validates :creator_id, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :body, length: {minimum: 10}
    validates :body, length: {maximum: 150}
    validates :event_date, presence: true
    validates :location, presence: true
  

    scope :past, -> {where("event_date <?", Time.now)}
    scope :upcoming, -> {where("event_date >?", Time.now)}
end
