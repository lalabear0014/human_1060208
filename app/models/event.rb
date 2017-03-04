class Event < ApplicationRecord

	validates_presence_of :name

	belongs_to :user

	has_many :messages

end
