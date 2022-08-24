require 'pry'

require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramable'
class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
include Paramable
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    @@artists << self
    super
    @songs = []
  end

@@ -18,15 +24,6 @@ def self.find_by_name(name)
  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
@@ -36,7 +33,5 @@ def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

end

