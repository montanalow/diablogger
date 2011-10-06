App.logger.level = Logger::DEBUG
App.cache_files = false

DataMapper::Logger.new LOG_FILE, :debug
#DataMapper.setup(:default, 'mysql://localhost/the_database_name')
#DataMapper.setup(:default, 'postgres://localhost/the_database_name')

Erector::Widget.prettyprint_default = true

