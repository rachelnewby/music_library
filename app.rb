require_relative 'lib/database_connection'

DatabaseConnection.connect('music_library')

sql = 'SELECT * FROM artists;'
result = DatabaseConnection.exec_params(sql, [])

result.each do |record|
  p record
end