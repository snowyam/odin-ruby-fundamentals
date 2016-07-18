# Substrings

def substrings(word, dictionary)

  list = {}

  dictionary.each do |w|
    count = word.downcase.scan(/#{w}/).count
    if count > 0
      list[w] = count
    end
  end
  p list
end

dictionary = ["below","down","go","going",
              "horn","how","howdy","it","i",
              "low","own","part","partner","sit"]

substrings("below", dictionary)
# => {"below"=>1, "low"=>1}
substrings("Howdy partner, sit down! How's it going?", dictionary)