class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :events, :through => :taggings

  validates :name, :slug, presence: true, uniqueness: true

  validate :slug_is_correct 

  def slug_is_correct
    if slug != CGI.escape(slug) or slug == "new"
      errors.add(:slug, "Invalid slug")
    end
  end

  def to_param
    slug
  end

end
