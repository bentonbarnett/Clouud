FactoryGirl.define do
  factory :message do
    nickname 'Name'
    room 'Room'
    message 'Message'
    color {Factory(:color)}
  end
end