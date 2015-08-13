class Tale < ActiveRecord::Base
    scope :grimm, -> {where(book: 'Grimm\'s Fairy Tales')}
    scope :scary_stories, -> {where(book: 'Scary Stories To Tell In The Dark')}
    validates :title, :author, :text, presence:true
end
