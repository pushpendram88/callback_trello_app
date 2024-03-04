# frozen_string_literal: true

FactoryBot.define do
  factory :card, class: 'Card' do
    text { Faker::Name.first_name }
    trello_card_id { '1' }
  end
end
