class AddReportToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :report, :text
  end
end
