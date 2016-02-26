def count_words(words_str)
  # Scrub the string of punctuation and capitals so it doesn't think 'To' is the same as 'to'
  # The regex also recognizes hyphenated words and words with apostraphes.
  words_arry = words_str.downcase.scan(/\w+[\'\-]?\w+/)

  # Create a new array. We'll store our arrays of words and their count here.
  counted_words = Array.new
  
  # Generate a list of the unique words in our array and iterate through them.
  words_arry.uniq.each do |x|
    # For each uniqe word, count how many times it occurs.
    # Add an array of that word + it's count to the counted_words array we created earlier.
    counted_words << [x, words_arry.count(x)]
  end

  # Call the counted words variable, as the last evaluated expression is returned in Ruby.
  # Not calling print in case we want this output raw for another emthod or class.
  counted_words
end

# Do some tests to verify, with different punctuation, and spacing, and apostraphes.
# Use newlines to separate output. Interporate the string to include method output.
print "\n#{count_words("To be or not to be.")}\n\n"
print "#{count_words("The quick, brown dog jumped over the lazy fox!")}\n\n"
print "#{count_words("     It is       what it  is                                       .")}\n\n"
print "#{count_words("My cat is a super cute cat, isn't it?")}\n\n"
print "#{count_words("My super-cute cat is a super-cute cat, isn't it?")}\n\n"
print "#{count_words("I meant to ask you-- Isn''t \"\"this\"\"\ \'super---great\'?")}\n"

# "Isn''t" won't be caught by the filter, but "Isn" will. Any hyphenated word with more then
# one hypen is broken up and taken as two words. A word in single quotes matches the word inside,
# but ignores the quotes at either end. The double-hypen sentence fragment is also split up.
# It isn't perfect, but you could say that misspelings aside, it's working as intended.
# Afterall, "Thsi" will match, as well as "corect". A great helper for this would be a spell-checking
# method to help weed out these matches before the words in the string are counted.