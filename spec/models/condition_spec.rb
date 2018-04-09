require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'validations' do
    it{should validate_presence_of :date}
    it{should validate_presence_of :max_temp}
    it{should validate_presence_of :min_temp}
    it{should validate_presence_of :average_temp}
    it{should validate_presence_of  :average_humidity}
    it{should validate_presence_of :average_visibility}
    it{should validate_presence_of :average_windspeed}
    it{should validate_presence_of :precipitation}
  end
end
