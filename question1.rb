# Problem
# transform a string "Abc///!!def****ff" to "abc-def-f"


def letter?(lookAhead)
  lookAhead =~ /[A-Za-z]/
end


result = []
"Abc///!!def****ff".split('').each_with_index do |char, i|
  if letter?(char)
   result << char.downcase
  else
   result << "-" unless (step1[i-1] == '-' && step1[i] == '-')
  end
end

result = result.join