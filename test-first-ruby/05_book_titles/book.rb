class Book
# write your code here
  attr_accessor :title

  def title
    no_caps = ["and", "the", "a", "an", "in", "of"]
    words = @title.split(" ").map { |word|
      if no_caps.include?(word)
        word
      else
        word.capitalize
      end
    }
    words.first.capitalize!
    words.join(" ")
  end

end
