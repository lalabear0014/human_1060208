class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
	has_many :events
	has_many :messages

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
