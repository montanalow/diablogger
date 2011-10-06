class Diablog
  include DataMapper::Resource
  
  property :id, Serial
  property :subject, String, :required => true, :length => (5..1000)
  property :creator_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :creator, :model => 'Author', :required => true, :default => Author.new

  has n, :posts, :order => :created_at
  has n, :authors, :through => :posts

  accepts_nested_attributes_for :creator
  accepts_nested_attributes_for :posts
  accepts_nested_attributes_for :authors
end
