class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
	has_many :events

	def short_name
  		self.email.split("@").first
  	end

	def admin?
		self.role == "admin"
	end

	def boss?
		self.role == "boss"
	end

	def staff?
		self.role == "staff"
	end

end
