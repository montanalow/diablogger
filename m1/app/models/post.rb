class Post
  include DataMapper::Resource

  property :author_id, Integer, :key => true
  property :diablog_id, Integer, :key => true
  property :created_at, DateTime, :key => true
  property :updated_at, DateTime
  property :up_votes, Integer
  property :down_votes, Integer
  property :body, Text, :lazy => false, :required => true

  belongs_to :author
  belongs_to :diablog

  has n, :comments, :order => :created_at

  validates_with_block :body do
    if body.split.size < 1000
      [true]
    else
      [false, "You've got too many words!  The limit is 1000." ]
    end
  end
end
