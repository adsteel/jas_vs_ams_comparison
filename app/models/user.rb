class User < ApplicationRecord
  has_many :posts

  validates :email, :name, presence: true
end
