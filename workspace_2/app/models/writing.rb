class Writing < ActiveRecord::Base
    validates_presence_of :title, :text, :member_id
    validates_uniqueness_of :title, :case_sensitive => false
    belongs_to :member
    scope :user_asc, -> { order(member.username :asc) }
    scope :user_desc, -> { order(member.username :desc) }
end
