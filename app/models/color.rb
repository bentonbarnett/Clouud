class Color < ActiveRecord::Base
  has_many :messages
  
  validates_presence_of :hex
end
