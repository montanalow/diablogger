class Comment
  include DataMapper::Resource

  belongs_to :post, :key => true, :required => true
  belongs_to :author, :key => true
  property :created_at, DateTime, :key => true
  property :updated_at, DateTime

end
