class Timer < ApplicationRecord
    has_many :tasks
    has_many :task_checklists, through: :tasks 
    has_many :checklists, through: :task_checklists 
    has_many :users, through: :checklists
end
