def substrings(string, dictionary)
  return "No empty strings" if string == ""
  string_array = string.split("")

  dictionary.reduce(Hash.new(0)) do |count, substr|
    string_array.each_index do |index|
      string_fragment = string_array[index..index+(substr.length-1)]
      if substr == string_fragment.join
        count[substr.to_sym] += 1
      end
    end

    count
  end
end

dictionary = ["be", "below", "low", "e"]
puts substrings("bebelow lowbelow", dictionary)