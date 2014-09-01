class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.integer :number_of_women, default: 0
      t.integer :number_of_men, default: 0
      t.string :organizer_name
      t.string :organizer_url
    end
  end
end
