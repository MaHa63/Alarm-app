class Customer < ApplicationRecord
   belongs_to :user
   has_many :todos
  
   def whole_name
    "#{last_name}, #{first_name}"
  end
  
  def customer_name
   "#{first_name} #{last_name}"
  end
  
end
