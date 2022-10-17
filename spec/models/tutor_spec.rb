# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it { should belong_to(:course) }
  end

  subject do
    described_class.new(name: 'Test name',
                        email: 'test@example.com')
  end

  context 'Validation Tests' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
