require 'rails_helper'

RSpec.describe User do
  describe 'properties' do
    it { should validate_presence_of(:name) }
    it { should_not allow_value('test@test').for(:email) }
    it { should_not allow_value('ruby').for(:email) }
    it { should allow_value('mai@gmail.com').for(:email) }
    it { should have_secure_password }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:campaigns) }
  end
end
