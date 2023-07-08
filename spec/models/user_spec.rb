require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(user_name: "Name",
                        email: "example@gmail.com",
                        password: "12345678",
                        password_confirmation: "12345678",
                        user_type: 0)
}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
