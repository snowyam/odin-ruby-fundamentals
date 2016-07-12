#write your code here
def translate(string)
  vowel = ["a", "e", "i", "o", "u"]
  latin = string.split(" ").map do |word|
    # Q and U
    if "q".include?(word[0]) && "u".include?(word[1])
      word << word.slice!(0..1)
    elsif !vowel.include?(word[0]) && "q".include?(word[1]) && "u".include?(word[2])
      word << word.slice!(0..2)
    # Vowel Consonant
    elsif vowel.include?(word[0])
      word.slice(0)   
    # Consonant Vowel
    elsif !vowel.include?(word[0]) && vowel.include?(word[1])
      word << word.slice!(0)
    # Consonant Consonant Consonant
    elsif !vowel.include?(word[0]) && !vowel.include?(word[1]) && !vowel.include?(word[2])
      word << word.slice!(0..2)
    # Consonant Consonant
    else !vowel.include?(word[0]) && !vowel.include?(word[1])
      word << word.slice!(0..1)
    end
    word << "ay"
  end
  latin.join(" ")
end