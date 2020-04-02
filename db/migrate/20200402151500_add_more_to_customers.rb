class AddMoreToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :more, :text
  end
end
