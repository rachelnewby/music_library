require_relative './album'

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record['id'].to_i
      album.title = record['title']
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i

      albums << album
    end

    return albums
    # Returns an array of Artist objects.
  end

  def create(album)
    sql = 'INSERT INTO albums
          (title, release_year, artist_id)
          VALUES ($1, $2, $3)'
    sql_params = [album.title, album.release_year, album.artist_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
end