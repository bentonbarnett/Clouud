class HomeController < ApplicationController
  def index
    @nearby_rooms = nearby_rooms
  end
  
  private
  
  def nearby_rooms
    # Actually, this just returns recently used rooms until
    # we get geolocation in place.
    messages = Message.select("DISTINCT room").limit("10").order("created_at DESC")
    
    messages.collect{|message| message.room}
  end
end