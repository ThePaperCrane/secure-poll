# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voted do
    user_id 1
    poll_id 1
  end
end
