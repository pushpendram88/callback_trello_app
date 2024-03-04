require 'rails_helper'

RSpec.describe Card, type: :model do
  # TODO: Test your card model logic here (if present).
   describe 'validations' do
    it { should validate_presence_of(:text) }
  end
end
