FactoryGirl.define do

  factory :event do
    name "Farmhouse Conf"
    start_date Faker::Date.forward(23)
    end_date Faker::Date.forward(23)
    email Faker::Internet.email
    time_zone "Pacific Time (US & Canada)"
    city "Hollywood"
    state "CA"
    sequence(:iterator) { |n| n }
    summary Faker::Lorem.sentence(5)
    description Faker::Lorem.paragraph(5)
    twitter Faker::Lorem.word
    instagram Faker::Lorem.word
    facebook Faker::Lorem.word
    code_of_conduct Faker::Lorem.paragraph(10)
  end

end
