FactoryGirl.define do
  factory :match do
      association :player1, factory: :user
      association :player2, factory: :user
      player1_score 10
      player2_score 21
      played_at Time.now.to_date
  end
end
