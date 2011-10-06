class User
  include DataMapper::Resource

  property :id, Serial

  has n, :login_addresses
  has 1, :author, :child_key => :id, :default => lambda{ |user,author| Author.new :id => user.id, :user => user }

end