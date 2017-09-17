FactoryGirl.define do
  factory :craft_beer do
    sequence(:name) {|n| "Flume #{n}" }
    sequence(:brewery) {|n| "Mast Landing #{n + 1}" }
    craft_beer_type "Double IPA"
    user_id 1111
  end
end
