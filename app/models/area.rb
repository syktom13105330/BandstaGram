class Area < ApplicationRecord
  
  def view_country_and_area
    self.c_name + " " + self.a_name.to_s
  end
end
