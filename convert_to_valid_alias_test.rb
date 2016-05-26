require_relative  "convert_to_valid_alias"
require "test/unit"

class ConvertToValidAliasTest < Test::Unit::TestCase

  def test_convert
    valid_alias_converter = ConvertToValidAlias.new

    assert_equal(valid_alias_converter.convert("aabc-def-gh"), "aabc-def-gh")
    assert_equal(valid_alias_converter.convert(""), "")
    assert_equal(valid_alias_converter.convert("abcdefgH"), "abcdefgh")
    assert_equal(valid_alias_converter.convert("a"), "a")
    assert_equal(valid_alias_converter.convert("*"), "-")
    assert_equal(valid_alias_converter.convert("-"), "-")
    assert_equal(valid_alias_converter.convert("-a-"), "-a-")
    assert_equal(valid_alias_converter.convert("aBdD****(&&^%e&%%f%%g&&11h"), "abdd-e-f-g-h")
    assert_equal(valid_alias_converter.convert("ABCd-----efgh---ijkl----fmlno---**--a--b"), "abcd-efgh-ijkl-fmlno-a-b")
    assert_equal(valid_alias_converter.convert("ABCdE**&&bbC--fE"), "abcde-bbc-fe")
  end

end