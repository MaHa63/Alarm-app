json.extract! todo, :id, :description, :created, :completed, :priority, :duedate, :closed, :created_at, :updated_at, :customer_id
json.url todo_url(todo, format: :json)
