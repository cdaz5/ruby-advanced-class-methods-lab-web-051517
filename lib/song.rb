
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    self.new(name)
end

def self.create_by_name(name)
  song = self.new(name)
  @@all << song
  song
end

def self.find_by_name(song_name)
  self.all.detect { |song| song.name == song_name }
end

def self.find_or_create_by_name(song_name)
  if self.all.include?(song_name)
    return song_name
  else
    self.create_by_name(song_name)
  end
end

def self.alphabetical
  self.all.sort_by { |song| song.name }
end

def self.new_from_filename(filename)
  file = filename.split(" - ")
  file[-1][/.mp3/] = ""
  Song.new(file[1], file[0])
end

def self.create_from_filename(filename)
  file = filename.split(" - ")
  file[-1][/.mp3/] = ""
  song = Song.new(file[1], file[0])
  @@all << song
end

def self.destroy_all
  @@all.clear
end




end #<!-- END OF SONG CLASS
# song = song.create
