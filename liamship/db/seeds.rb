# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

("A".."J").to_a.each do |row|
  10.times { |i| Coordinate.create(row: row, column: (i+1).to_s) }
end

bs = LiamBattleship.new
bs.save
lc = LiamCarrier.new
lc.save
ls = LiamSweeper.new
ls.save
lsub = LiamSub.new
lsub.save
lf = LiamFrigate.new
lf.save
