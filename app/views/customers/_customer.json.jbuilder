json.extract! customer, :id, :first_name, :last_name, :phone_nbr, :street, :zip_code, :user_id, :city, :created_at, :updated_at
json.url customer_url(customer, format: :json)
