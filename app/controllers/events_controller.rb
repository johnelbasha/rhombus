class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to root_path, flash: { notice: 'Event created' }
    else
      flash[:danger] = "Event has not been created!"
      render "new"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :confirmation_message, :creation_button_text, :creation_button_url, :email_confirmation) 
    end

end
