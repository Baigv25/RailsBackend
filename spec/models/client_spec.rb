require 'rails_helper'

RSpec.describe Client, type: :model do
  subject {
    described_class.new(client_name: "Name",
                        email: "example@gmail.com",
                        client_password: "12345678",
                        direction: "1km al este del parque",
                        status_client: 0)
  }
end
