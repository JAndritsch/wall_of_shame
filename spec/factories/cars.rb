# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make "MyString"
    model "MyString"
    color "MyString"
    plate_number "MyString"
    plate_state "MyString"
    getty false
  end
end
