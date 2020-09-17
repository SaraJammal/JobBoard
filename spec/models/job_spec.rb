require 'rails_helper'

RSpec.describe Job, :type => :model do

  # it "is valid with valid attributes" do
  #   expect(Job.new).to be_valid
  # end
  #
   subject { described_class.new }

    it "is valid with valid attributes" do
      subject.title = "Job1"
      subject.description = "Job1 description"
      subject.created_at = DateTime.now
      subject.expiryDate = DateTime.now + 1.week
      subject.company =
      subject.category = "fulltime"
      expect(subject).to be_valid
    end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a created-at" do
    subject.created_at = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a expiryDate" do
    subject.expiryDate = nil
    expect(subject).to_not be_valid
  end

end