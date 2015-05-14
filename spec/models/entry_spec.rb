require 'spec_helper'

RSpec.describe Entry, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # # it "has a valid factory" do
  # FactoryGirl.create(:entry).should be_valid
  # end

  # it "is invalid without a date"
  # it "is invalid without a food"
  # it "is invalid without a mood"

  it "creates an entry" do
    entry = build(:entry)
    expect(entry).to be_instance_of Entry
  end

  describe "models" do

    context "with valid entry" do
      before(:each) do
        @entry = build(:entry, :date => 05052015, :food => "abcdedfdfg", :mood => 4)
      end

      it "should save OK" do
        expect(@entry).to be_valid
      end

    end

    context "with invalid date" do
      before(:each) do
        @entry = build(:entry, :food => "sddfgdfgdg", :mood => 4, :date => "")
      end

      it "should not be accepted" do
        expect(@entry).to be_invalid
      end

    end

    context "with invalid food" do
      before(:each) do
        @entry = build(:entry, :food => "", :mood => 4, :date => "05052015")
      end

      it "should not be accepted" do
        expect(@entry).to be_invalid
      end
    end

    context "with invalid mood" do
      before(:each) do
        @entry = build(:entry, :food => "dfgdfgdfg", :mood => -30, :date => "05052015")
      end

      it "should not be accepted" do
        expect(@entry).to be_invalid
      end
    end

  end

end