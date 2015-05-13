require 'rails_helper'

RSpec.describe Entry, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # it "has a valid factory" do
  #   FactoryGirl.create(:entry).should be_valid
  # end

  it "is invalid without a date"
  it "is invalid without a food"
  it "is invalid without a mood"

  it "creates an entry" do
    entry = build(:entry)
    expect(entry).to be_instance_of Entry
  end

  describe "models" do
    context "with valid data" do
      before(:each) do
        @entry = build(:entry,:food => "abcdefg", :mood => 4)
      end

      it "should save OK" do
        expect(@entry).to be_valid
      end

    end

    context "with invalid data" do
      before(:each) do
        @entry = build(:entry, :food => "", :mood => -30, :date => 45670985)
      end

      it "should not be accepted" do
        expect(@entry).to be_invalid
      end
    end
  end


end
