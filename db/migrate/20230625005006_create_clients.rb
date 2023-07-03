class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :email
      t.string :client_password
      t.string :direction
      t.integer :status_client

      t.timestamps
    end
  end
end
