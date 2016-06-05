# This is the Boyer-Moore-Horspool algorithm for fast string searching.
# https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore%E2%80%93Horspool_algorithm
class HorspoolStringFind

  # Uses the Boyer-Moore-Horspool algorithm to search needle in a haystack.
  # It generates a skip table and then uses that to skip over the haystack for efficiency.
  def search(needle, haystack)
    return -1 if needle.nil? || haystack.nil? || needle.length == 0 || haystack.length == 0

    skip_table = generate_skip_table(needle)

    haystack_index = 0

    while !haystack_finished?(needle, haystack, haystack_index)
      mismatch = find_mismatch(haystack_index, needle, haystack)

      return haystack_index if mismatch.nil?

      skip_value = skip_value(mismatch, skip_table, needle)
      haystack_index = haystack_index+skip_value
    end

    -1
  end

  private

  # Generates the skip table for a needle. It is very important to skip the last item of the needle, or else one will
  # end up with an infinite loop. For example, if the needle is 'how', then this will generate { h -> 2, o->1 }.
  def generate_skip_table(needle)
    skip_table = {}

    (0..needle.length-2).each do |index|
      character = needle[index]
      skip_table[character.downcase] = needle.length - index - 1
    end

    skip_table
  end

  # Reads from the skip table and returns the value. If the character is not found, it will return the length of the
  # needle.
  def skip_value(character, skip_table, needle)
    return skip_table[character.downcase] unless skip_table[character.downcase].nil?
    needle.length
  end

  # Returns the character that caused the mismatch. If none found then it returns nil.
  def find_mismatch(haystack_index, needle, haystack)
    return nil if haystack_finished?(needle, haystack, haystack_index)

    haystack_end_index = haystack_index+needle.length-1
    haystack_end_index.downto(haystack_index) do |index|
      return haystack[index] if (needle[index-haystack_index].downcase != haystack[index].downcase)
    end

    nil
  end

  # Returns false if haystack index has exceeded the haystack length.
  def haystack_finished?(needle, haystack, haystack_index)
    haystack_index>haystack.length-1 || haystack_index+needle.length-1>haystack.length-1
  end

end
