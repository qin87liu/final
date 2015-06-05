class Teacher < ActiveRecord::Base
  has_many :assignments
  has_many :assistants, through: :assignments

  validates :name, presence: true
 
end
