class Feedback < ApplicationRecord
  validates :name, :comments, presence: true, allow_blank: false
end
