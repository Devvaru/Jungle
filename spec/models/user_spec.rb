require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new(
        firstname: "John",
        lastname: "Smith",
        email: "john@smith.com",
        password: "1234",
        password_confirmation: "1234",
      )
    end

    it "validates that the user is valid" do
      @user.save
      expect(@user).to be_valid
    end

    it "validates that a user's firstname is present" do
      @user.firstname = nil
      @user.save
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "validates that a user's lastname is present" do
      @user.lastname = nil
      @user.save
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it "validates that a user's email is present" do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "validates that a user's email is not case sensitive" do
      @user.save
      @user2 = User.new(
        firstname: "John2",
        lastname: "Smith2",
        email: "JOHN@SMITH.com",
        password: "12345",
        password_confirmation: "12345",
      )
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "validates that a user's password is present" do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "validates that a user's password and password_confirmation are equal" do
      @user.password = "1234"
      @user.password_confirmation = "4321"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "validates that a user's password is at least 3 characters" do
      @user.password = "12"
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end
end
