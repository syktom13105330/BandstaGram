class AppMessage < ApplicationRecord

  belongs_to :recruitment
  belongs_to :user
end
