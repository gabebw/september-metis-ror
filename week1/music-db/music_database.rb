require "csv"

class MusicDatabase
  def initialize
    @database = {}
  end

  def read_database(file_name)
    CSV.foreach(file_name, { headers: true }) do |row|
      artist = row["Artist"]
      track_name = row["Name"]
      populate_database_with(artist, track_name)
    end

    @database
  end

  private

  def populate_database_with(artist, track_name)
    if !@database[artist]
      @database[artist] = []
    end

    @database[artist] << track_name
  end
end
