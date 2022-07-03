class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :creator_id, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :body, length: {minimum: 10}
    validates :event_date, presence: true
    validates :location, presence: true
end
