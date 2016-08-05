# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Player1", password: "123456")
User.create(name: "Player2", password: "123456")

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

bs2 = LiamBattleship.new
bs2.save
lc2 = LiamCarrier.new
lc2.save
ls2 = LiamSweeper.new
ls2.save
lsub2 = LiamSub.new
lsub2.save
lf2 = LiamFrigate.new
lf2.save

gsbs1 = GameShip.new(game_id: 1, player_id: 1, ship_id: bs.id)
gslc1 = GameShip.new(game_id: 1, player_id: 1, ship_id: lc.id)
gsls1 = GameShip.new(game_id: 1, player_id: 1, ship_id: ls.id)
gslsub1 = GameShip.new(game_id: 1, player_id: 1, ship_id: lsub.id)
gslf1 = GameShip.new(game_id: 1, player_id: 1, ship_id: lf.id)

gsbs2 = GameShip.new(game_id: 1, player_id: 2, ship_id: bs2.id)
gslc2 = GameShip.new(game_id: 1, player_id: 2, ship_id: lc2.id)
gsls2 = GameShip.new(game_id: 1, player_id: 2, ship_id: ls2.id)
gslsub2 = GameShip.new(game_id: 1, player_id: 2, ship_id: lsub2.id)
gslf2 = GameShip.new(game_id: 1, player_id: 2, ship_id: lf2.id)

gsbs1.save
gslc1.save
gsls1.save
gslsub1.save
gslf1.save
gsbs2.save
gslc2.save
gsls2.save
gslsub2.save
gslf2.save

p1_ships = GameShip.where(player_id: 1)
 4.times { |i| p1_ships[0].coordinates << Coordinate.find_by(id: i+1)}
 5.times { |i| p1_ships[1].coordinates << Coordinate.find_by(id: i+11)}
 3.times { |i| p1_ships[2].coordinates << Coordinate.find_by(id: i+21)}
 3.times { |i| p1_ships[3].coordinates << Coordinate.find_by(id: i+31)}
 2.times { |i| p1_ships[4].coordinates << Coordinate.find_by(id: i+41)}

p2_ships = GameShip.where(player_id: 2)
 4.times { |i| p2_ships[0].coordinates << Coordinate.find_by(id: i+1)}
 5.times { |i| p2_ships[1].coordinates << Coordinate.find_by(id: i+11)}
 3.times { |i| p2_ships[2].coordinates << Coordinate.find_by(id: i+21)}
 3.times { |i| p2_ships[3].coordinates << Coordinate.find_by(id: i+31)}
 2.times { |i| p2_ships[4].coordinates << Coordinate.find_by(id: i+41)}

