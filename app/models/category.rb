class Category < ApplicationRecord
    has_many :checklists
    has_many :user_checklists, through: :checklists
    has_many :users, through: :user_checklists
end
