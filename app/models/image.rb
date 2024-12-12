class Image < ApplicationRecord
  has_one_attached :file

  validate :acceptable_image

  private

  def acceptable_image
    return unless file.attached?

    if !file.content_type.in?(%('image/jpeg image/png image'))
      errors.add(:file, :invalid_format)
    elsif file.byte_size > 3.megabytes
      errors.add(:file, :too_large)
    end
  end
end
