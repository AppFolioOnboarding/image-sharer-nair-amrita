class ImagePost < ApplicationRecord
  acts_as_taggable_on :tags
  has_one_attached :image
  validate :type_validation
  validate :attached_validation
  validates :title, presence: true
  validates_length_of :title, minimum: 5, maximum: 10

  def type_validation
    return if image.attached? && image.blob.content_type.starts_with?('image/')

    image.purge
    errors[:base] << 'Invalid image file type uploaded'
  end

  def attached_validation
    errors[:base] << 'No image uploaded' unless image.attached?
  end
end
