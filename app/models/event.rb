class Event < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  has_many :comments 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def self.search(search)
    if search
      self.where("title LIKE :search OR description LIKE :search OR location LIKE :search", search: "%#{search}%")
    else
      self.all
    end
  end
end
