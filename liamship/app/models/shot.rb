class Shot < ApplicationRecord
  belongs_to :coordinate
  belongs_to :player, class_name: "User"
  belongs_to :game
end
