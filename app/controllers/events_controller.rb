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
		respond_to do |format|
			format.html
			format.pdf do
				pdf = EventPdf.new(@event)
				send_data pdf.render, filename: "order_#{@event}.pdf",
									  type: "application/pdf",
									  disposition: "inline"
			end
		end
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
		params.require(:event).permit(:name, :idnumber, :data_validation, :station,
									  :birthday, :sex, :education, :experience,
									  :phone, :contact, :email, :address,
									  :process, :assess, :use, :money, :effect,
									  :description, :avatar)
	end

	def prepare_variable_for_index_template

		if current_user
			if current_user.admin?
				@events = Event.all
				# 判斷Search
				if params[:keyword]
					k = "%#{params[:keyword]}%"
					@events = @events.where( "name like ? or station like ?", k, k )	
				end
				# 判斷人員的events
				if params[:staffname]
					@staffs = User.all
					s = "%#{params[:staffname]}%"
					@staffs = @staffs.where( "email like ?", s )
					@events = @staffs.to_a[0].events
				end
			elsif current_user.boss?	# 如果current_user是boss
				# 抓boss及staff的events
				@events = Event.joins(:user).merge( User.where(role: ['boss','staff']) )
				# @events = Event.joins(:user).merge( User.where("role=? OR role=?","boss","staff") )
				# 判斷Search
				if params[:keyword]
					k = "%#{params[:keyword]}%"
					@events = @events.where( [ "name like ? or station like ?", k, k ] )
				end
				# 判斷人員的events
				if params[:staffname]
					@staffs = User.where( role: ['boss','staff'] )
					s = "%#{params[:staffname]}%"
					@staffs = @staffs.where( "email like ?", s )
					@events = @staffs.to_a[0].events
				end
			else
				user = current_user
				@events = user.events
				if params[:keyword]
					k = "%#{params[:keyword]}%"
					@events = @events.where( "name like ? or station like ?", k, k )
				end
			end
			@events = @events.page( params[:page] ).per(8)
		end
		
	end

end
