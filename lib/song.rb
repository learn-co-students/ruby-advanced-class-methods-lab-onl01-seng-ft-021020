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
    new_song = Song.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    return new_song
  end
  
  
  
  
  def self.find_by_name(name)
    a = @@all.any?{ |song| song.name == name}
    
    if(a)
      return @@all.find{ |song| song.name == name }
    end
    
    return nil
  end
  
  
  
  
  
  def self.find_or_create_by_name(name)
    
    find = self.find_by_name (name) 
    
  #  puts find
    
    if(find == nil )
      
      result = self.create_by_name name
     
    else
       
      result = find
    end
    
    result
  end
  
  
  
  
  
  def self.alphabetical
    return @@all.sort_by!{ |s| s.name.downcase }
  end
 
 
  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    
    artist_name = data[0]
    name = data[1].split(".")[0]
    
    new_song = new_by_name(name)
    new_song.artist_name = artist_name
    
    new_song
  end
  
  def self.create_from_filename(file_name)
    data = file_name.split(" - ")
    
    artist_name = data[0]
    name = data[1].split(".")[0]
    
    new_song = create_by_name(name)
    new_song.artist_name = artist_name
    
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end


s1 = Song.find_or_create_by_name("hi")
s2 = Song.find_or_create_by_name("hi")


puts s1 == s2
