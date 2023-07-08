require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject {
    described_class.new(name: "Pizza",
                        status_dish: :active)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "has rich text description" do
    expect(subject).to respond_to(:description)
  end
end
