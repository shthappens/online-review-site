FactoryGirl.define do
  factory :craft_beer do
    sequence(:name) {|n| "Flume #{n}" }
    sequence(:brewery) {|n| "Mast Landing #{n + 1}" }
    craft_beer_type "Double IPA"
    sequence(:user_id) {|n| "1#{n + 1}" }
  end
end
