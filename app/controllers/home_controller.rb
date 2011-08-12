class HomeController < ApplicationController
  def index
    @active_rooms = active_rooms
  end
  
  private
  
  def active_rooms
    ['portland', 'madison', 'bonfire', 'beatles', 'sxsw room 105']
  end
end