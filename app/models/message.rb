class Message < ApplicationRecord
  belongs_to :user
  has_many :comments
 acts_as_votable
 has_many :message_categories
 has_many :categories, :through => :message_categories
end
