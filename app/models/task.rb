class Task < ApplicationRecord

    belongs_to :timer 
    belongs_to :category
    has_many :task_checklists
    has_many :checklists, through: :task_checklists
    has_many :users, through: :checklists

    validates :name, presence: true

end