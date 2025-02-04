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
    self.all << song
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
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_info = filename.split(%r{[-/.]})
    song = self.new_by_name(song_info[1].strip)
    song.artist_name = song_info[0].strip
    song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(%r{[-/.]})
    song = self.create_by_name(song_info[1].strip)
    song.artist_name = song_info[0].strip
    song
  end

  def self.destroy_all
    @@all = []
  end

end
