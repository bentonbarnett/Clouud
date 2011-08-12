class Message < ActiveRecord::Base
  validates_presence_of :nickname, :room, :message

  def color_as_hex
    "##{color}"
  end

  def text
    return message
  end
end
