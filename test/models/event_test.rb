require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not be valid if it does not have all attributes" do
    event = Event.new(
      name: "grr", location: "Berlin", date: "1999-05-25", number_of_men: 4, 
      number_of_women: 41, organizer_url: "http://guides.rubyonrails.org", 
      organizer_name: "Travis" 
    )
    assert event.valid?
  end
end

