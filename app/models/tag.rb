class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :events, :through => :taggings

  validates :name, :slug, presence: true

  def to_param
    slug
  end

end
