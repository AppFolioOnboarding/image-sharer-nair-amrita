class Post < ApplicationRecord
    has_one_attached :image
    validate :image_validation
    validates :title, presence: true
    validates_length_of :title, minimum: 5, maximum: 10

    def image_validation
      if image.attached?
        if !image.blob.content_type.starts_with?('image/')
          image.purge
          errors[:base] << 'Invalid image file type uploaded'
        end
      else
        image.purge
        errors[:base] << 'No image uploaded'
      end
    end
end
