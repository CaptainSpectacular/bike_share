require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it{should validate_presence_of :username}
    it{should validate_presence_of :password}
    it{should validate_presence_of :role}
  end
  describe 'authorization' do
    it "can be admin" do
      admin = create(:admin)

      expect(admin.admin?).to be_truthy
    end
    it "can be base" do
      user = create(:user)

      expect(user.registered?).to be_truthy
    end
  end
end
