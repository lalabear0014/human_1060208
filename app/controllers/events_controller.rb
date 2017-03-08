class EventsController < ApplicationController

	# load_and_authorize_resource param_method: :event_params
	# authorize_resource :event, :except => [:index]

	before_action :authenticate_user!, :except => [:index]

	before_action :set_event, :only => [:show, :edit, :update, :destroy]

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
		@event = current_user.events.build( event_params )
		authorize @event
		
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
		if @event.update_attributes( event_params )
			flash[:notice] = "編輯成功"
			redirect_to event_path(@event)
		else
			render :action => :edit	# edit.html.erb
		end
	end

	# DELETE /events/:id
	def destroy
		@event.destroy
		flash[:alert] = "刪除成功"
		
		redirect_to events_path
	end

	private

	def set_event
		@event = Event.find( params[:id] )
		authorize @event
	end

	def event_params
		params.require(:event).permit(:name, :sex, :birthday, :email, :phone, :contact, :address, :description)
	end

	def prepare_variable_for_index_template

		if params[:keyword]
			@events = Event.where( [ "name like ?", "%#{params[:keyword]}%" ] )
		elsif current_user
			if current_user.admin?
				@events = Event.all
			elsif current_user.boss?	# 如果current_user是boss
				# 抓boss及staff的events
				@events = Event.joins(:user).merge( User.where(role: ['boss','staff']) )
				# @events = Event.joins(:user).merge( User.where("role=? OR role=?","boss","staff") )
			else
				@events = current_user.events
			end
			@events = @events.page( params[:page] ).per(100)
		end
	
	end

end
