class Checklist < ApplicationRecord
    belongs_to :category
    has_many :user_checklists
    has_many :users, through: :user_checklists
    has_many :task_checklists
    has_many :tasks, through: :task_checklists
    has_many :timers, through: :tasks 
    accepts_nested_attributes_for :task_checklists

    #validates :title, uniqueness: true, presence: true


    def total_time
        minutes_array = self.timers.map do |timer|
            timer.minutes
        end
        minutes_array.sum
    end

end

