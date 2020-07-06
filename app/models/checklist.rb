class Checklist < ApplicationRecord
    belongs_to :category
    has_many :user_checklists
    has_many :users, through: :user_checklists
    has_many :task_checklists
    has_many :tasks, through: :task_checklists
    has_many :timers, through: :tasks 
end
