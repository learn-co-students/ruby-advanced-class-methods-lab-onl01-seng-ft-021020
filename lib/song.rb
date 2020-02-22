class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    resault = self.all.detect {|song| song.name == name}
    resault
  end
  
  def self.find_or_create_by_name(name)
    resault = self.find_by_name(name)
    if resault
      resault
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted_list = self.all.sort_by {|song| song.name}
    sorted_list
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    file_array = self.new_from_filename(filename)
    song = self.create 
    song.name = file_array.name 
    song.artist_name = file_array.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
