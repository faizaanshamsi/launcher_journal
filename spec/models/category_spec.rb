require 'spec_helper'

describe Category do
    describe 'Database Tests' do

    it { should have_db_column(:name).of_type(:string) }

  end

  describe 'Validation Tests' do

    it { should have_valid(:name).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:name).when('', nil) }

    it {should validate_uniqueness_of(:name)}

  end

  describe 'Association Tests' do

    it {should have_many(:entries)}

  end
end
