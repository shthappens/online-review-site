FactoryGirl.define do
  factory :user, class: 'User' do
    sequence(:email) {|n| "sht#{n + 1}@shthappens.com" }
    password "secretpassword"
    sequence(:id) {|n| "1#{n + 1}" }
  end
end
