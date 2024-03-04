# frozen_string_literal: true

class Card < ApplicationRecord
  # TODO: Add the relationship / methods of the Trello Card here
  validates :text, presence: true
end
