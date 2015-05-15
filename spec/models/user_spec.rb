require 'rails_helper'


RSpec.describe User, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  # it "has a valid factory" do
  #   FactoryGirl.create(:user).should be_valid
  # end
  # it "is invalid without an email"
  # it "is invalid without a password"
  # it "should require :password length to be greater than 8 characters"

  before {
    @user = FactoryGirl.build(:user)
  }

  subject { @user }

  it { should be_valid }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should_not allow_value('foodomain.com').for(:email) }

  # it { should respond_to(:authentication_token) }
  # it { should validate_uniqueness_of(:authentication_token) }


end
