class List < ApplicationRecord
  validates_presence_of :title, :due_date, :note 
end
