class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :image_type_and_size

  private

  def image_type_and_size
    return unless image.attached?

    if image.blob.byte_size > 2.megabytes
      errors.add(:image, "should be less than 2MB")
    end

    acceptable_types = ["image/jpeg", "image/gif", "image/png", "image/webp"]
    unless acceptable_types.include?(image.blob.content_type)
      errors.add(:image, "must be a valid image format (JPEG, PNG, GIF, or WEBP)")
    end
  end
end
