class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  #validate :title, presence: true
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :body
end
