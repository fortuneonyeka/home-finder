class Property < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  has_one_attached :image, dependent: :destroy
  belongs_to :account

  validates :name ,presence: true
  validates :address ,presence: true
  validates :price ,presence: true
  validates :rooms ,presence: true
  validates :bathrooms ,presence: true
end
