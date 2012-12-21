# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poll do
    question "MyText"
    option_a "MyText"
    option_a_score 1
    option_b "MyText"
    option_b_score 1
    option_c "MyText"
    option_c_score 1
    option_d "MyText"
    option_d_score 1
  end
end
