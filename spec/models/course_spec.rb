# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should have_many(:tutors) }
  end

  context 'Validation Tests' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
