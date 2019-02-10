class Category < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum: 25}
  validates_uniqueness_of :name
  has_many :message_categories
  has_many :messages, :through => :message_categories
end
