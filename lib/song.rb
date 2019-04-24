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
    song = Song.new 
    song.save
    song 
  end
  
  def self.new_by_name(name)
    song = Song.new 
    song.name = name
    song 
  end
  
  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song 
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name) #returns song instance or nil 
    song = Song.create_by_name(name) if !song #nil 
    song  
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file) #file="Taylor Swift - Blank Space.mp3"
    file = file.chomp(".mp3")
    file = file.split(" - ")
    song = self.new 
    name = file[0]
    artist_name = file[1]
    
  end

end
