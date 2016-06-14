require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

#Create row
mt = MyTable.create "title" => "I saw it again!"

puts "Count: #{MyTable.count}"

top_id = mt["id"].to_i
(1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id["title"]}."
end
