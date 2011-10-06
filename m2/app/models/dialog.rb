class Dialog
  include DataMapper::Resource
  
  property :id, Serial
  property :headline, String, :required => true, :length => (5..120)
  property :creator_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  property :views, Integer, :default => 0
  property :agrees, Integer, :default => 0
  property :disagrees, Integer, :default => 0

  property :agreement, Float, :default => 0
  property :convinced_users, Integer, :default => 0

  belongs_to :creator, :model => 'Author', :required => true, :default => Author.new

  has n, :posts, :order => :created_at
  has n, :authors, :through => :posts

  before :save do
    self.agreememnt = disagrees > 0 && agrees > 0 ? (agrees / dissagrees - 0.5) * 2 : 0
  end

  def self.most_convincing limit
    self.all :order => :agreement, :limit => limit
  end
end
