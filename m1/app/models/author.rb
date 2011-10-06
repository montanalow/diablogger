class Author
  include DataMapper::Resource

  property :id, Integer, :key => true
  property :email, String, :format => :email_address, :unique => true, :length => (1..100), :messages => {
    :presence => "We need your email address.",
    :is_unique => "We've already got a registration for that email.",
    :format => "That doesn't look like an email address to me..."
  }
  property :pseudonym, String, :required => true, :length => (1..30)
  property :city, String # TODO geolocate primary login IP address and autofill city, state, country, postal
  property :state, String
  property :country, String
  property :postal, String
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :user, :child_key => :id, :required => true, :unique => true, :default => User.new

  has n, :posts
  has n, :diablogs, :through => :posts
  has n, :comments

  def to_json options
    if options[:methods]
      options[:methods] << :id
    else
      options[:methods] = [:id]
    end
    
    super options
  end
end
