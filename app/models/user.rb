class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
	has_many :events
	has_many :messages

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/egg.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def short_name
  		self.email.split("@").first
  	end

	def admin?
		self.role == "admin"
	end

	def boss?
		self.role == "boss" || admin?
	end

	def staff?
		self.role == "staff" || boss? || admin?
	end

end
