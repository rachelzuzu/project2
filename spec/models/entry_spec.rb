require 'spec_helper'

RSpec.describe Entry, :type => :model do
 # pending "add some examples to (or delete) #{__FILE__}"




 it "creates an entry" do
   entry = build(:entry)
   expect(entry).to be_instance_of Entry
 end

 describe "models" do
   context "with valid data" do
     before(:each) do
       @entry = build(:entry, :date => 12122015, :food => "abcdefg", :mood => 4)
     end

     it "should save OK" do
       expect(@entry).to be_valid
     end

   end

   context "with invalid date" do
     before(:each) do
       @entry = build(:entry, :date => "", :food => "abcdefg", :mood => 4)
     end

     it "should not be accepted" do
       expect(@entry).to be_invalid
     end
   end

      context "with invalid food" do
     before(:each) do
       @entry = build(:entry, :date => 12122015, :food => "", :mood => 4)
     end

     it "should not be accepted" do
       expect(@entry).to be_invalid
     end
   end

      context "with invalid mood" do
     before(:each) do
       @entry = build(:entry, :date => 12122015, :food => "banana", :mood => -30)
     end

     it "should not be accepted" do
       expect(@entry).to be_invalid
     end
   end

 end


end