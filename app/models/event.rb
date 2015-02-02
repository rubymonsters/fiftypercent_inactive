class Event < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings

  validates :name, :location, :date, :number_of_women, :number_of_men, :organizer_name, :organizer_url, :percent_women, presence: true

  def percent_women
  	 #puts "SCHEISSE"
  	 number_of_women.to_f / (number_of_women + number_of_men).to_f * 100
  end

  def formatted_tags
  	tags.map {|tag| "#" + tag.name}.join(", ")
  end	
end
