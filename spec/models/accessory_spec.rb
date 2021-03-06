require 'rails_helper'

RSpec.describe Accessory, type: :model do
  describe 'validations' do
    it{ should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it{ should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
  end
end
