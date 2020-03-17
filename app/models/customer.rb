class Customer < ApplicationRecord
   belongs_to :user
   has_many :todos
  
   geocoded_by :whole_address
   after_validation :geocode
  
   def whole_name
    "#{last_name}, #{first_name}"
  end
  
  def customer_name
   "#{first_name} #{last_name}"
  end
  
  def whole_address
    "#{street}" + " " + "#{city}"
  end
  
end
