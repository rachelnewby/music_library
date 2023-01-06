require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    user_choice = 0
    while user_choice != 1 && user_choice != 2 
      @io.puts "What would you like to do?"
      @io.puts "1 - List all albums"
      @io.puts "2 - List all artists"
      user_choice = @io.gets.to_i 

      if user_choice == 1
        @io.puts "Here is the list of albums:"
        results = @album_repository.all
        results.each { |record| @io.puts "#{record.id} - #{record.title}" }
        break
      
      elsif user_choice == 2
        @io.puts "Here is the list of artists:"
        results = @artist_repository.all
        results.each { |record| @io.puts "#{record.id} - #{record.name}" }
        break
      end
    end
  end
end



if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end


# album_repository = AlbumRepository.new
# artist_repository = ArtistRepository.new
# application = Application.new('music_library_test', Kernel, album_repository, artist_repository)
# application.run

# DatabaseConnection.connect('music_library')


# # artist_repository = ArtistRepository.new

# # artist_repository.all.each do |artist|
# #   p "#{artist.id} - #{artist.name} - #{artist.genre}"
# # end

# # album_repository = AlbumRepository.new

# # album_repository.all.each do |album|
# #   p "#{album.id} - #{album.title} - #{album.release_year} - #{album.artist_id}"
# # end

# repo = AlbumRepository.new

# new_album = Album.new
# new_album.title = 'SAWAYAMA'
# new_album.release_year = 2020
# new_album.artist_id = 6
# repo.create(new_album)

# repo.all.each do |album|
#   p "#{album.id} - #{album.title} - #{album.release_year} - #{album.artist_id}"
# end