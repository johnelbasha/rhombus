class OfferingsController < ApplicationController
  def show
    @event = Event.find_by(uid: params[:id])
  end
end
