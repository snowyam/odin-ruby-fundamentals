#write your code here
def echo(string)
  "#{string}"
end

def shout(string)
  "#{string}".upcase
end

def repeat(string, n = 2)
  "#{string}" + " #{string}" * (n - 1)
end

def start_of_word(string, n = 1)
  string[0, n]
end

def first_word(string)
  string.split.first
end

def titleize(string)
  no_caps = ["and", "the", "over"]
  title = string.split(" ").map { |word|
    if no_caps.include?(word)
      word
    else
      word.capitalize
    end
  }
  title.first.capitalize!
  title.join(" ")
end