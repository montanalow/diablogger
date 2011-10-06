if ENV['RACK_ENV'] == 'development'
  LOG_FILE = $stdout
else
  LOG_FILE = File.open (File.expand_path "../../log/#{ENV['RACK_ENV']}.rb", __FILE__), 'w'
end
App.logger = Logger.new LOG_FILE

load File.expand_path "../environments/#{ENV['RACK_ENV']}.rb", __FILE__

DataMapper.setup :default, "sqlite3://#{File.expand_path "../../db/#{ENV['RACK_ENV']}.db", __FILE__}"

