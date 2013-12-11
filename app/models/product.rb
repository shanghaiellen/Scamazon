class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  mount_uploader :image, ImageUploader
end
