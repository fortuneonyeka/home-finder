class Property < ApplicationRecord
  belongs_to :account

  validates :name ,presence: true
  validates :address ,presence: true
  validates :price ,presence: true
  validates :rooms ,presence: true
  validates :bathrooms ,presence: true
end
