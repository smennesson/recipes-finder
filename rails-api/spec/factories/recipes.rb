# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { Faker::Name.name }
    rate { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
  end
end
