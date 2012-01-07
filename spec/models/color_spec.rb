require 'spec_helper'

describe Color do
  it "has a hex value" do 
    color = create(:color)
    color.hex.should_not == nil
  end
end
