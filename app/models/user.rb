class User < ApplicationRecord
    has_many :user_checklists
    has_many :categories, through: :user_checklists
    has_many :checklists, through: :user_checklists
    has_many :task_checklists, through: :checklists
    has_many :tasks, through: :task_checklists 

    has_secure_password

    def user_checklists
    	self.checklists.each{|checklist| checklist.title}
    end

end
