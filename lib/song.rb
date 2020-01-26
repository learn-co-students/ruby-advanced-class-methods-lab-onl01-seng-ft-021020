class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end

  def self.add_song(song)
    @@all.push(song)
  end
  
  def save
    self.class.all << self
  end

  def self.create()
    new_song = self.new
    
    @@all << new_song
    
    new_song
  end
  
  def self.new_by_name(song_name)
    new_song = self.new
    
    new_song.name = song_name
    
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    
    new_song.name = song_name
    @@all << new_song
    
    new_song
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      return song if song.name === song_name
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    # if self.find_by_name(song_name)
    #   self.find_by_name(song_name)
    # else
    #   self.create_by_name(song_name)
    # end
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical()
    return @@all.sort_by! { |song| song.name.downcase }
  end
  
  def self.new_from_filename(filename)
    new_song = self.new
    new_song.artist_name = filename.split(' - ')[0]
    # puts new_song.artist_name
    new_song.name = filename.split(' - ')[1].chomp!('.mp3')
    # puts new_song.name
    
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new
    
    new_song.artist_name = filename.split(' - ')[0]
    new_song.name = filename.split(' - ')[1].chomp!('.mp3')

    @@all << new_song
  end

  def self.destroy_all()
    @@all = []
  end

end

song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

