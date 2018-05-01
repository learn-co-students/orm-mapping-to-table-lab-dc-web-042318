require 'bundler'
Bundler.require

require_relative '../lib/student'

DB = {conn: SQLite3::Database.new("db/students.db")}

# an instance of a database connection

# module SQLite3
#   class Database
#     def execute(sql_command_string, *args)
#       executing the sql_command_string and passing in the arguments in order
#     end
#   end
# end
