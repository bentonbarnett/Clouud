class RoomController < ApplicationController
  before_filter :set_nickname
  before_filter :set_room
  before_filter :set_color
  
  def show
    join_room params['room']
    @new_message = Message.new :nickname => @nickname, :room => @room, :color_id => @color.id
    
    @messages = Message.where('room = ?', params['room']).where('created_at >= ?', timeout)
  end
  
  private
  
  def join_room(room_name)
    session['previous_room'] = session['room'] if session['room']
    @room = room_name
    
    set_color get_new_color(room_name) if session['room'].nil? || (session['previous_room'] && session['previous_room'] != room_name)
    session['room'] = room_name
  end
end