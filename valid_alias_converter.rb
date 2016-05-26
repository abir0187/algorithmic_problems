# Remove non-letters from a String and replaces them with a dash. All the valid letters should be converted to
# lower case as well. For example, it will transform a string like "Abc///!!def****ff" to "abc-def-f".
# There are some edge cases we are not handling. Please refer to the test coverage to find those.
class ValidAliasConverter

  def letter?(character)
    character =~ /[A-Za-z]/
  end

  def convert(sentence)
    dash_duplicated_buffer = []
    # Replace all non-letters to '-'.
    sentence.split('').each_with_index do |char, i|
      if letter?(char)
        dash_duplicated_buffer << char.downcase
      else
        dash_duplicated_buffer << '-'
      end
    end

    final_buffer = []
    final_buffer << dash_duplicated_buffer[0] if dash_duplicated_buffer.length >= 0

    # Handle 0 or 1 sized string.
    return final_buffer.join('') if dash_duplicated_buffer.length == 0 || dash_duplicated_buffer.length == 1

    # Simply remove duplicated dashes.
    for i in 1..dash_duplicated_buffer.length
      current_char = dash_duplicated_buffer[i]
      previous_char = dash_duplicated_buffer[i-1]

      if (current_char == '-' && previous_char == '-')
        next
      else
        final_buffer << current_char
      end
    end

    final_buffer.join('')

  end

end