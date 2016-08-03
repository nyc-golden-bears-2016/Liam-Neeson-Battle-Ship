class Ship < ApplicationRecord
  has_many :boxes
  belongs_to :board
  belongs_to :user
  validates :lives, :board_id, :user_id, presence: true
end
