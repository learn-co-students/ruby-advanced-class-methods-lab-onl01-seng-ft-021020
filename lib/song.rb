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
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
    
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song
  end
  
  def self.find_by_name(name_t)
    return_val=nil
    @@all.each do |song|
      if song.name == name_t
        return_val = song
      end
    end
    return_val
  end
  
  def self.find_or_create_by_name(name)
    return_val = find_by_name(name)
    
    if return_val == nil 
      return_val = create_by_name(name)
    end 
    
    return_val
    
  end
  
  def self.alphabetical
    @@all.each.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(string)
    array = string.split(" - ")
    array[1] = array[1].split(".")
    array = array.flatten
    
    song = self.new 
    song.name = array[1]
    song.artist_name = array[0]
    #@@all << song
    song
    
    
    
  end
  
  def self.create_from_filename(string)
    array = string.split(" - ")
    array[1] = array[1].split(".")
    array = array.flatten
    
    song = self.new 
    song.name = array[1]
    song.artist_name = array[0]
    song.save
    song
    
    
  end
  
  def self.destroy_all
    @@all.clear
  end

end
