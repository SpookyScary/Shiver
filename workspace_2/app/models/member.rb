class Member < ActiveRecord::Base
    has_secure_password
    has_many :writings
    validates :username, presence: true
    validates_uniqueness_of :username, :case_sensitive => false
end
