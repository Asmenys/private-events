class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :attended_events, foreign_key: "attendee_id", class_name: "Event"

  
end
