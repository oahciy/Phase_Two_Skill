class DiaryEntry
  
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @count = 0
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.size
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    count_words / wpm
  end

 def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    array = @contents.split
    words = wpm * minutes 
    if @count > array.length
      @count = 0
    end
    words_read = array[@count,@count + words].join(" ")
    @count += words
    return words_read
 end
end