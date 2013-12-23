require 'spec_helper'

describe Entry do
  describe 'Database Tests' do

    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:category_id).of_type(:integer) }

  end

  describe 'Validation Tests' do

    it { should have_valid(:title).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:title).when('', nil) }

    it { should have_valid(:description).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:description).when('', nil) }

    it {should validate_numericality_of(:category_id).only_integer}
    it {should have_valid(:category_id).when(nil)}

  end

  describe 'Association Tests' do

    it {should belong_to(:category)}

  end
end
