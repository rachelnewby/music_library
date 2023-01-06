require_relative '../lib/album_repository'

RSpec.describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it 'Returns #all items as expected' do
    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.length).to eq(2)
    expect(albums.first.id).to eq(1)
    expect(albums.first.title).to eq('Hold the Girl')
    expect(albums.first.release_year).to eq(2022)
    expect(albums.first.artist_id).to eq(1)
  end

  it "#create a new album in the directory" do
    repo = AlbumRepository.new
    
    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = 1991
    new_album.artist_id = 1
    repo.create(new_album)
    expect(repo.all).to include(
      have_attributes(
        title: new_album.title,
        release_year: 1991,
        artist_id: 1 
      )
    )
  end

end