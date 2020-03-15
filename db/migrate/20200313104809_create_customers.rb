class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_nbr
      t.string :street
      t.integer :zip_code
      t.string :city
      t.integer :user_id

      t.timestamps
    end
  end
end
