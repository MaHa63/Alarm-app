class AddCustomerIdToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :customer_id, :integer
  end
end
