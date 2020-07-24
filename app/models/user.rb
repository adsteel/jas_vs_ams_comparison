class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :post

  validates :email, :name, presence: true
end
