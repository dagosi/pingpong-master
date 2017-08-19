puts "Adding users..."
30.times do
  name = Faker::Name.unique.first_name
  User.create!(email: "#{name}@regalii.com", password: 'scret123', name: name)
end

puts "Adding matches..."

500.times do
  player1 = User.all.sample
  player2 = User.where("id != ?", player1.id).sample
  player1_score = 21
  player2_score = rand(0..19)

  Match.create!(player1: player1, player2: player2, player1_score: player1_score, player2_score: player2_score, played_at: rand(1..100).days.ago)
end
