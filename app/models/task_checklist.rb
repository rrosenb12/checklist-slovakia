class TaskChecklist < ApplicationRecord
    belongs_to :task
    belongs_to :checklist 
end
