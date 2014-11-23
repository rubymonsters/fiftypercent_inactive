class Event < ActiveRecord::Base
  validates :name, :location, :date, :number_of_women, :number_of_men, :organizer_name, :organizer_url, :percent_women, presence: true

  def percent_women
  	 puts "SCHEISSE"
  	 puts "number_of_women #{number_of_women}"
  	 puts "number_of_men #{number_of_men}"
  	 number_of_women.to_f / number_of_men.to_f * 100
  end	
end
