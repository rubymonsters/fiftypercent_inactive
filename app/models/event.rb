class Event < ActiveRecord::Base
  validates :name, :location, :date, :number_of_women, :number_of_men, :organizer_name, :organizer_url, presence: true
end
