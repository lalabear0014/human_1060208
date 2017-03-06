class EventMessagesController < ApplicationController

	before_action :set_event
	before_action :set_message, :only => [:show, :edit, :update, :destroy]

	def index
		@messages = @event.messages
	end

	def show
		
	end

	def new
		@message = @event.messages.build
		authorize @message
	end

	def create 
		@message = @event.messages.build( message_params )
		authorize @message

		@message.user = current_user

		if @message.save
			flash[:notice] = "新增成功"
			redirect_to event_path(@event)
		else
			render :action => :new
		end
	end

	def edit
		
	end

	def update
		if current_user == @message.user
			if @message.update( message_params )
				flash[:notice] = "編輯成功"
				redirect_to event_path(@event)
			else
				render :action => :edit
			end
		else
			flash[:alert] = "非創建者"
			redirect_to event_path(@event)
		end		
	end

	def destroy
		if current_user == @message.user
			@message.destroy
			flash[:alert] = "刪除成功"
		else
			flash[:alert] = "非創建者"
		end

		redirect_to event_path(@event)
	end

	protected

	def message_params
		params.require(:message).permit(:content)
	end

	def set_event
		@event = Event.find( params[:event_id] )
	end

	def set_message
		@message = @event.messages.find( params[:id] )
		authorize @message
	end

end
