class Song
  attr_accessor :name, :artist_name
  @@all = [song = Song.create
  Song.all.include?(song)]

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

s = Song.new
s.name = "The Ship Song"
s.artist_name = "Nick Cave"
s.save


song = Song.new_by_name("The Middle")
song.name

song = Song.creat_by_name("The Middle")
song
Song.all.include?(song)

the_middle = Song.create_by_name("The Middle")
Song.find_by_name("The Middle")

song_1 = Song.find_or_create_by_name("Blank Space")
song_2 = Song.find_or_create_by_name("Blank Space")
song_1 == song_2

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song.namesong.artist_name
