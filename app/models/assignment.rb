class Assignment < ActiveRecord::Base
  validates :name, presence: true
  validates :num_assignments, presence: true
  validates :due_date, presence: true
  validates :estimate_time, presence: true


	belongs_to :teacher
	belongs_to :assistant
end
