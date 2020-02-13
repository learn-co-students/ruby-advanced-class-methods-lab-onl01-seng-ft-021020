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
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    # new_song.save
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    return new_song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song == nil ? self.create_by_name(name) : song

  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
    
  def self.new_from_filename(file)
    file_arr = file.split(" - ")
    new_song = new_by_name(file_arr[1].split(".").first)
    new_song.artist_name = file_arr[0]
    return new_song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

  def self.destroy_all
    @@all.clear
  end
end
