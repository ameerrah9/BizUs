class BizPlan < ActiveRecord::Base
    # association macro
    belongs_to :user
    # model validations
    validates :name, presence: true
    validates :name, length: { minimum: 3}
    validates :mission, presence: true
    validates :mission, length: { minimum: 3}
    validates :budget, presence: true
    validates :budget, length: { minimum: 3}
end