App.logger.level = Logger::WARN
App.cache_files = true

DataMapper::Logger.new LOG_FILE, :error
#DataMapper.setup(:default, 'sqlite3::memory:')
#DataMapper.setup(:default, 'mysql://localhost/the_database_name')
#DataMapper.setup(:default, 'postgres://localhost/the_database_name')

Erector::Widget.prettyprint_default = false

