require 'pry'
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
        song.save
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
      song.save 
      song
    end

    def self.find_by_name(name)
     
       self.all.find {|i| i.name == name}
   end
    
    def self.find_or_create_by_name(name)
   
      self.find_by_name(name) || self.create_by_name(name)
   
   end
    
    def self.alphabetical
     
     
    @@all.sort{ |a, b| a.name <=> b.name }
    
   end
   
    def self.new_from_filename(song_name)
     results = song_name.split(' - ',2)
        artist_name = results [0] 
          name = results[1]
     mp3_results = name.split('.',2)
        name = mp3_results[0]

            song = self.new
               song.name =name
               song.artist_name = artist_name
               song
    end
    
  def self.create_from_filename(song_name)
   results = song_name.split(' - ',2)
        artist_name = results [0] 
          name = results[1]
     mp3_results = name.split('.',2)
        name = mp3_results[0]

            song = self.create
               song.name =name
               song.artist_name = artist_name
               song
    end
   def self.destroy_all
     self.all.clear
   end
end




