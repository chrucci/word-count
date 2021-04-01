defmodule WordCountTest do
  use ExUnit.Case

  test "append to map" do
    mymap = %{}
    word = "word"
    appendedMap = Map.put(mymap, word, 1)

    assert appendedMap == %{"word" => 1}
  end

  test "split a sentence" do
    sentence = "each of one"
    result = String.split(sentence)
    assert result == ["each", "of", "one"]
  end

  test "update map with pipe" do
    mymap = %{foo: 1}
    newmap = %{mymap | foo: 2}

    assert newmap == %{:foo => 2}
  end

  # @tag :pending
  # test "reduce array to map" do
  #   sentence = ["each", "of", "one"]
  #   mymap = %{}
  #   result = Enum.reduce(sentence, mymap, fn x, acc -> %{acc} end)
  #
  #   expected = %{"one" => 1, "of" => 1, "each" => 1}
  #   assert result == expected
  #
  # end

  defp doUpperCase(word) do
    String.upcase(word)
  end

  test "Uppercase each word via private function" do
    words = ["each", "of", "one"]
    ucaseWords = Enum.map(words, fn(a) -> doUpperCase(a) end)
    assert ucaseWords == ["EACH", "OF", "ONE"]
  end

  test "Uppercase each word" do
    words = ["each", "of", "one"]
    ucaseWords = Enum.map(words, fn(a) -> String.upcase(a) end)
    assert ucaseWords == ["EACH", "OF", "ONE"]
  end

  #@tag :pending
  test "count one word" do
    assert WordCount.count("word") == %{"word" => 1}
  end

  # @tag :pending
  test "count one of each" do
    expected = %{"one" => 1, "of" => 1, "each" => 1}
    assert WordCount.count("one of each") == expected
  end

  #@tag :pending
  test "count multiple occurrences" do
    expected = %{"one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1}
    assert WordCount.count("one fish two fish red fish blue fish") == expected
  end

  #@tag :pending
  test "ignore punctuation" do
    expected = %{"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
    assert WordCount.count("car : carpet as java : javascript!!&@$%^&") == expected
  end

  #@tag :pending
  test "include numbers" do
    expected = %{"testing" => 2, "1" => 1, "2" => 1}
    assert WordCount.count("testing, 1, 2 testing") == expected
  end

  # @tag :pending
  test "hyphens" do
    expected = %{"co-operative" => 1}
    assert WordCount.count("co-operative") == expected
  end

  # @tag :pending
  test "ignore underscores" do
    expected = %{"two" => 1, "words" => 1}
    assert WordCount.count("two_words") == expected
  end

  # @tag :pending
  test "normalize case" do
    expected = %{"go" => 3}
    assert WordCount.count("go Go GO") == expected
  end

  # @tag :pending
  test "German" do
    expected = %{"götterfunken" => 1, "schöner" => 1, "freude" => 1}
    assert WordCount.count("Freude schöner Götterfunken") == expected
  end
end
