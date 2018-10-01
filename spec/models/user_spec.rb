require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid User" do
   user = User.new(
    name: "Test_1",
    phone: "098397050",
    email: "test_1_last@email.com",
    role: "1", created_at: Time.zone.now, updated_at: Time.zone.now,
    password: "123456",
    password_confirmation: "123456")
   expect(user).to be_valid
  end

  describe User, type: :model do
    it "database schema" do
      should have_db_column(:email).of_type(:string)
      should have_db_column(:name).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:phone).of_type(:string)
      should have_db_column(:role).of_type(:boolean)
    end
  end

  describe User, type: :model do
    it " validations"do
      should validate_presence_of :name
      should validate_length_of(:name).
        is_at_most(50).with_message("is too long (maximum is 50 characters)")
      should validate_presence_of :email
      should validate_presence_of :phone
      should validate_presence_of :password
      should validate_length_of(:password).
        is_at_least(6).with_message("is too short (minimum is 6 characters)")
    end
  end
end
