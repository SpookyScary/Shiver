class Tale < ActiveRecord::Base
    scope :recently_added, -> { order(created_at: :desc) }
    scope :oldest, -> { order(created_at: :asc) }
    validates :title, :author, :text, presence:true
    validates_uniqueness_of :title, :case_sensitive => false
    
    def self.search(search)
        if search
            self.where("title LIKE ? OR author LIKE ?", "%#{search}%","%#{search}%")
        else
            self.all
        end
    end
end
