require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it{should validate_presence_of :status}
    it{should validate_presence_of :date_time}
    it{should validate_presence_of :user_id}
  end
end
