class Mp3_analyzer
  
  def initialize( mp3_path = false )
    @mp3 = open( mp3_path ) if mp3_path
  end
  
  def analyze( new_mp3_path = false )
    @mp3 = open( new_mp3_path ) if new_mp3_path
    if @mp3 && has_tag?
      song_info = { song: pull(30), artist: pull(30), album: pull(30), year: pull(4), comment: pull(30) }
    else
      false
    end
  end
  
  def has_tag?
    if @mp3 and @mp3.size > 128
      @mp3.seek(-128, IO::SEEK_END)
      @mp3.read(3) == 'TAG'
    else
      false
    end
  end
  
  
  private
  
  def open( path )
    begin
      File.open( path )
    rescue
      warn('The mp3 you are trying to open does not exist')
      false
    end
  end
  
  def pull( n )
    @mp3.read( n ).rstrip
  end
end