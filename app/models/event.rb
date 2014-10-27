class Event < ActiveRecord::Base
  validates :name, :location, :date, :organizer, :organizer_url, :number_of_women, :percentage_of_women, presence: true
end