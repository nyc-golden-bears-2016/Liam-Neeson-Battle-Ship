class User < ApplicationRecord
  has_many :boards
  has_many :ships
  validates :username, presence: true, uniqueness: true
end
