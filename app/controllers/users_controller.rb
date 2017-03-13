class UsersController < ApplicationController

	def index
		
	end

	def show
		@user = User.find( params[:id] )
	end

	def new
		@user = User.new
	end

	def create
	  @user = User.create( user_params )
	  @user.save
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:avatar)
	end

end
