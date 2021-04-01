defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    strip_punct(sentence)
      |> String.downcase()
      |> String.split([" ", "_"], trim: true)
      |> Enum.frequencies()
  end

  defp strip_punct(word) do
    String.replace(word, ~r/[^a-zA-Z0-9ö_ \-]/, "")
  end
end
