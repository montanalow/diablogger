class User
  include DataMapper::Resource

  property :id, Serial

  has n, :login_addresses
  has 1, :author
end