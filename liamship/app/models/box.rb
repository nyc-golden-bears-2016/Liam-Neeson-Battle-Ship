class Box < ApplicationRecord
  belongs_to :ship
  validates :row, :column, :shot?, presence: true
end
