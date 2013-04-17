# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make "Ford"
    model "Tempo"
    color "Red"
    plate_number "ABC-123"
    plate_state "WI"
    getty false

    factory :car_with_violations do
      ignore do
        violation_count 3
      end

      after(:create) do |car, evaluator|
        FactoryGirl.create_list(:parking_violation, evaluator.violation_count, car: car)
      end
    end
  end

  factory :parking_violation do
    description "Parked in a getty spot"
    car
  end
end
