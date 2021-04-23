class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.uid = generate_uid
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

  def generate_uid
    (0...9).map { (65 + rand(26)).chr }.join
  end

end
