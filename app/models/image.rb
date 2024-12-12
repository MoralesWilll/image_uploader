class Image < ApplicationRecord
  has_one_attached :file

  validate :acceptable_image
  validates :title, presence: true
  validates :description, presence: true
  validates :file, presence: true

  private

  def acceptable_image
    return unless file.attached?

    if !file.content_type.in?(%('image/jpeg image/png image'))
      errors.add(:file, "must be a JPEG,or PNG")
    elsif file.byte_size > 3.megabytes
      errors.add(:file, "is too large. Maximum size is 3 MB.")
    end
  end
end
