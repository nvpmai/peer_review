require 'rails_helper'

RSpec.describe Campaign do
  describe 'properties' do
    it { should validate_presence_of(:name) }
  end
end
