class EventsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	# GET /events
	def index
		@events = Event.page( params[:page] ).per(10)
	end

end
