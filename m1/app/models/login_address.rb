class LoginAddress
  include DataMapper::Resource

  belongs_to :user, :required => true, :key => true
  property :ip, Integer, :key => true
  property :postal, String
  property :logins, Integer
  property :created_at, DateTime
  property :updated_at, DateTime
end