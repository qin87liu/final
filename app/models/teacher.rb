class Teacher < ActiveRecord::Base
  has_many :assignments
  has_many :assistants, through: :assignments
end
