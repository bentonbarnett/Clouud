require 'spec_helper'

describe Message do
  it "has a message" do 
    message = create(:message)
    message.message.should == "Message"
  end
end