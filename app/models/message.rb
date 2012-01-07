class Message < ActiveRecord::Base
  validates_presence_of :nickname, :room, :message
  
  belongs_to :color

  def color_as_hex
    "##{color}"
  end

  def text
    return message
  end
end
