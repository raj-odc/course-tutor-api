require 'rails_helper'

RSpec.describe Tutor, type: :model do

  describe 'associations' do
    it { should belong_to(:course) }
  end

  subject {
    described_class.new(name: "Test name",
                        email: "test@example.com")
                       }

  context 'Validation Tests' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
