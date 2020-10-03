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
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song 
  end
  
  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
   @@all.find{ |song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) ||
   self.create_by_name(song_name)
 end
 
  def self.alphabetical 
    self.all.sort_by{|s| s.name}
  end 
  
  def self.new_from_filename(filename)
    song = Song.new
    song.name = (filename.split(" - ")[1].gsub(".mp3", ""))
    song.artist_name = (filename.split(" - ")[0])
    song
  end 
  
  def self.create_from_filename(filename)
     song = Song.new
    song.name = (filename.split(" - ")[1].gsub(".mp3", ""))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end 
  
  def self.destroy_all
    Song.all.clear
  end 
end
