require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    Song.all << self
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
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    remove_mp3 = file_name.sub(/.mp3/, "")
    split_name = remove_mp3.split(" - ")
    song = Song.new
    song.name = split_name[1]
    song.artist_name = split_name[0]
    song
  end

  def self.create_from_filename(file_name)
    remove_mp3 = file_name.sub(/.mp3/, "")
    split_name = remove_mp3.split(" - ")
    song = Song.new
    song.name = split_name[1]
    song.artist_name = split_name[0]
    song.save
    song
  end

  def self.destroy_all
    Song.all.clear

  end

end



song_1 = Song.create_by_name("Thriller")
song_2 = Song.create_by_name("Blank Space")
song_3 = Song.create_by_name("Call Me Maybe")

p Song.all.sort_by { |song| song.name }