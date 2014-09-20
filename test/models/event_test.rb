require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "it persists a model" do
    event = Event.new(name: "Froscon")
    event.save
    assert event.persisted?
  end 

  test "should be valid if it has a name" do
    event = Event.new(name: "Froscon")
    assert event.valid?
  end

  test "should not be valid if it does not have a name" do
    event = Event.new(name: nil)
    assert event.invalid?
  end
end

