class Event < ApplicationRecord

	validates_presence_of :name, :idnumber, :data_validation, :station,
							:birthday, :sex, :education, :experience,
							:phone, :contact, :email, :address,
							:process, :assess, :use, :money, :effect
	
	belongs_to :user
	has_many :messages

	has_attached_file :avatar,
		styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" },
		:default_url => "egg.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
