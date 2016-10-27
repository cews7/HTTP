class WordSearch
  def dictionary
    handle = File.readlines("/usr/share/dict/words")
    new_dictionary = handle.map {|word| word.gsub(/\n/, "")}
  end

  def word_search_response(word_fragment)
    if dictionary.include?(word_fragment)
      "#{word_fragment} is a known word"
    else
      "#{word_fragment} is not a known word"
    end
  end
end
