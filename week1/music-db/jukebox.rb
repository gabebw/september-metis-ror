require "./music_database"

class Jukebox
  def initialize(database)
    @database = database
  end

  def query
    print "Artist Name > "
    artist_name = gets.chomp
    songs = @database[artist_name]
    puts "*" * 50
    puts artist_name
    puts "*" * 50
    puts songs.sort
  end
end

music_database = MusicDatabase.new
database = music_database.read_database("music.csv")

jukebox = Jukebox.new(database)
jukebox.query
