class Post
  include DataMapper::Resource

  property :author_id, Integer, :key => true
  property :dialog_id, Integer, :key => true
  property :created_at, DateTime, :key => true
  property :updated_at, DateTime
  property :up_votes, Integer
  property :down_votes, Integer
  property :content, Text, :lazy => false, :required => true

  belongs_to :author
  belongs_to :dialog

  has n, :comments, :order => :created_at

  validates_with_block :body do
    if body.split.size <= max_word_count
      [true]
    else
      [false, "Oops, your post is too long! The limit is #{max_word_count} words."]
    end
  end

  def self.max_word_count
    300
  end
end
