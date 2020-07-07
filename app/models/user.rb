class User < ApplicationRecord
    has_many :user_checklists
    has_many :categories, through: :user_checklists
    has_many :checklists, through: :user_checklists
    has_many :task_checklists, through: :checklists
    has_many :tasks, through: :task_checklists 

    has_secure_password

    # validates :username, presence: true
    # validates :username, uniqueness: true


end
