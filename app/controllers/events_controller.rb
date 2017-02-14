class EventsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	before_action :set_event, :only => [:show, :dashboard, :edit, :update, :destroy]

	# GET /events
	def index
		prepare_variable_for_index_template
	end

	# GET /events/:id
	def show
		@page_title = @event.name
	end

	# GET /events/new
	def new
		@event = Event.new
		authorize @event
	end

	# POST /events
	def create
		@event = Event.new( event_params )
		authorize @event

		@event.user = current_user
		
		if @event.save
			flash[:notice] = "新增成功"

			redirect_to events_path	# 告訴瀏覽器 HTTP code: 303
		else
			render :action => :new	# new.html.erb
		end
	end

	# GET /events/:id/edit
	def edit
		
	end

	# PATCH /events/:id
	def update
		authorize @event
    
		if @event.update( event_params )
			flash[:notice] = "編輯成功"
			redirect_to event_path(@event)
		else
			render :action => :edit	# edit.html.erb
		end
	end

	# DELETE /events/:id
	def destroy
		authorize @event

		@event.destroy
		flash[:alert] = "刪除成功"

		redirect_to events_path
	end

	private

	def set_event
		@event = Event.find( params[:id] )
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end

	def prepare_variable_for_index_template

		if params[:keyword]
			@events = Event.where( [ "name like ?", "%#{params[:keyword]}%" ] )
		else
			@events = Event.all	
		end

		@events = @events.page( params[:page] ).per(10)
	end

end
