require 'rails_helper'

RSpec.describe Job, elasticsearch: true, :type => :model do
  it 'should be indexed' do
    expect(Job.__elasticsearch__.index_exists?).to be_truthy
  end
end