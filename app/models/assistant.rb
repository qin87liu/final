class Assistant < ActiveRecord::Base
  has_many :reviews
  has_many :assignments
  has_many :teachers, through: :assignments
end
