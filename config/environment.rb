require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

PROMPT = TTY::Prompt.new

#removes the SQL fire from the displayed info in the terminal :)
old_logger = ActiveRecord::Base.logger 
ActiveRecord::Base.logger = nil
