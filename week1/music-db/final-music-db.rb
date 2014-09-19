# Students should put each class in a separate file.

require 'csv'

class MusicDatabaseReader
  def initialize(file_name)
    @file_name = file_name
    @music = {}
  end

  def read
    CSV.foreach(@file_name, headers: true) do |row|
      song_name = row["Name"]
      artist_name = row["Artist"]

      if ! @music.key?(artist_name)
        @music[artist_name] = []
      end

      @music[artist_name] << song_name
    end

    @music
  end
end

class Jukebox
  def initialize(music_database)
    @music_database = music_database
  end

  def search
    print_welcome_message

    loop do
      artist_name = ask_for_artist_name

      if artist_name == ""
        break
      else
        print_header(artist_name)
        puts @music_database[artist_name].sort
      end
    end
  end

  private

  def print_welcome_message
    puts "Just hit <Enter> to quit"
    puts
  end

  def print_header(artist_name)
    message = "* Songs by #{artist_name} *"
    puts "*" * message.size
    puts message
    puts "*" * message.size
  end

  def ask_for_artist_name
    print "Query: "
    gets.chomp
  end
end

music_database_reader = MusicDatabaseReader.new("music.csv")
music_database = music_database_reader.read

jukebox = Jukebox.new(music_database)
jukebox.search
