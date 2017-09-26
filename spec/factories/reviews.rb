FactoryGirl.define do
  factory :craft_beer_review do
    sequence(:description) {|n| "A tasty ale #{n}!" }
    rating "5"
    sequence(:user_id) {|n| "1#{n + 1}" }
    sequence(:craft_beer_id) {|n| "1#{n + 1}" }
  end
end
