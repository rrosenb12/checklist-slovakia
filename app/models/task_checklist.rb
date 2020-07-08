class TaskChecklist < ApplicationRecord

    belongs_to :task
    belongs_to :checklist 

    validates_uniqueness_of :task_id, :scope => :checklist_id
end
