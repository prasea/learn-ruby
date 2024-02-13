dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
sentence = "below below howdy going to go"
def substrings(sentence, dictionary)
  hash = {}
  word_array = sentence.downcase.split
  word_array.each do |word|
    dictionary.each do |dict_word|
      if(word.include?dict_word)
        if hash.has_key?(dict_word)
          hash["#{dict_word}"] += 1
        else
          hash["#{dict_word}"] = 1        
        end          
      end
    end
  end
  p hash
end

substrings(sentence, dictionary)
# substring(sentence, dictionary)
# p "Below below".downcase.split