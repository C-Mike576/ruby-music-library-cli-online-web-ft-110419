class MusicImporter
    attr_accessor :path
    
  def initialize(filepath)
   @path = filepath
   files
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    @files.each { |filename| Song.create_from_filename(filename) }
  end

end
