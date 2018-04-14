require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'validations' do
    it{should validate_presence_of :name}
    it{should validate_presence_of :dock_count}
    it{should validate_presence_of :city}
    it{should validate_presence_of :installation_date}
  end

  describe 'relationships' do
    it{should respond_to :start_trips}
    it{should respond_to :end_trips}
  end
end
