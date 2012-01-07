class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def default_color
    Color.first
  end
  
  def get_new_color(room)
    color = default_color
    
    if room
      color = next_color(highest_color_for_room(room))
    end
    
    color
  end
  
  def highest_color_for_room(room)
    message_with_highest_color = Message.where('room = ?', params['room']).where('created_at >= ?', timeout).sort{|message| message.color_id <=> message.color_id}.last
    
    if message_with_highest_color && message_with_highest_color.color
      return message_with_highest_color.color
    else
      return default_color
    end
  end
  
  def is_nickname_valid?(nickname)
    nickname.length > 2 && nickname.length < 20
  end
  
  def next_color(color)
    
    unless Color.last == color
      attempted_color = Color.find(color.id + 1)
    end

    attempted_color ||= Color.first
    
    attempted_color
  end
  
  def room_or_root
    if session['room']
      show_room_path(session['room'])
    else
      root_path
    end
  end
  
  def set_color(color=nil)
    session['colors'] ||= {}
    
    if color
      @color = color
    end
    
    if @room
      if session['colors'] && session['colors'][@room]
        @color ||= Color.find(session['colors'][@room])
      else
        @color ||= get_new_color(@room)
      end
    
      session['colors'][@room] = @color.id if @color
    end
    
    return @color ? true : false
  end
  
  def set_room
    @room = session['room'] if session['room']
  end
  
  def set_nickname(nickname=nil)
    if nickname
      session['nickname'] = nickname
    end
    @nickname = session['nickname'] if session['nickname']
    @nickname ||= 'Someone'
  end
  
  def timeout
    36.hours.ago
  end
end
