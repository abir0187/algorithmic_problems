require_relative "../src/horspool_string_find"
require "test/unit"

class HorsepoolStringFindTest < Test::Unit::TestCase
  def setup
    @horspool = HorspoolStringFind.new
  end

  def test_search_when_needle_nil
    assert_equal(@horspool.search(nil, "abc"), -1)
  end

  def test_search_when_needle_empty
    assert_equal(@horspool.search("", "abc"), -1)
  end

  def test_search_when_haystack_nil
    assert_equal(@horspool.search("abc", nil), -1)
  end

  def test_search_when_haystack_empty
    assert_equal(@horspool.search("abc", ""), -1)
  end

  def test_search_when_needle_exists
    assert_equal(@horspool.search("How", "Hello there, how are you?"), 13)
    assert_equal(@horspool.search("HoW", "Hello there, HOW are you?"), 13)
    assert_equal(@horspool.search("how", "Hello there, How are you?"), 13)
    assert_equal(@horspool.search("HOW", "Hello there, hoW are you?"), 13)
    assert_equal(@horspool.search("me", "If you haven't got anything nice to say about anybody, come sit next to me."), 57)
    assert_equal(@horspool.search("next", "If you haven't got anything nice to say about anybody, come sit next to me."), 64)
    assert_equal(@horspool.search("**12", "Hello there, who are you !!!**12343?"), 28)
    assert_equal(@horspool.search("HOW are you", "Hello there, how are you?"), 13)
    assert_equal(@horspool.search("brell", "Can you give me my umbrella?"), 21)
    assert_equal(@horspool.search("brella?", "Can you give me my umbrella?"), 21)
    assert_equal(@horspool.search("umbrella?", "Can you give me my umbrella?"), 19)
    assert_equal(@horspool.search("um", "Can you give me my umbrella?"), 19)

  end

  def test_search_when_needle_does_not_exist
    assert_equal(@horspool.search("how", "Hello there, who are you?"), -1)
    assert_equal(@horspool.search("who", "Hello there, how are you?"), -1)
  end

end