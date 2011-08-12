class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def colors
    # Clean this up later
    [
      'EDAFC0',
      '626E69',
      'AD808D',
      '909B8A'
    ]
  end
  
  private
  
  def default_color
    colors[0]
  end
  
  def get_new_color(room)
    if room
      if colors.index(highest_color_for_room(room)) >= colors.length
        return colors[0]
      else
        return next_color(highest_color_for_room(room))
      end
    else
      return colors[0]
    end
  end
  
  def highest_color_for_room(room)
    message_with_highest_color = Message.where('room = ?', params['room']).where('created_at >= ?', timeout).sort{|message| colors.index(message.color) <=> colors.index(message.color)}.last
    
    if message_with_highest_color && message_with_highest_color.color && colors.include?(message_with_highest_color.color)
      return message_with_highest_color.color
    else
      return default_color
    end
  end
  
  def is_nickname_valid?(nickname)
    nickname.length > 2 && nickname.length < 20
  end
  
  def next_color(color)
    colors[(colors.index(color) + 1)]
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
        @color ||= session['colors'][@room]
      else
        @color ||= get_new_color(@room)
      end
    
      session['colors'][@room] = @color if @color
    end
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
