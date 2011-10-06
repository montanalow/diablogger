require ::File.expand_path '../app/app', __FILE__
use Rack::CommonLogger, LOG_FILE unless ENV['RACK_ENV'] == 'development'
use Rack::Session::Cookie, :key => '_dialog_is_session', :secret => '98b36984f05f917ac24eb24f2931d5ceb3b9ae7a6496eca003e6e4e8bc120316fc77d959e035733db5d5e7d304b1f8876bc6fc5aae33c24b657cd1c477135053'
use Rack::Reloader unless App.cache_files
run App::Dispatch