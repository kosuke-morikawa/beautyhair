class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Photo.where('text LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end
