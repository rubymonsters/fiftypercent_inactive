class CreateTagsAndTaggings < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.text :description
      t.string :slug, null: false
      t.timestamps null: false
    end
    create_table :taggings do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :event, index: true
      t.timestamps null: false
    end
  end
end
