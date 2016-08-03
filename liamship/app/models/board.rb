class Board < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :opponent, class_name: "User"
  validates :host_id, presence: true
end
