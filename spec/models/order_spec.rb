require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:dish) { Dish.create(name: "Pizza") }
  let(:client) { Client.create(client_name: "Juan", email: "example@gmail.com") }

  subject {
    described_class.new(dish: dish,
                        client: client,
                        status: :delayed)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a dish" do
    subject.dish = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a client" do
    subject.client = nil
    expect(subject).to_not be_valid
  end
end
