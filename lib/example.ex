defmodule Example do
  # 1. reverse string "hello world"
  # 2. convert to uppercase
  # 3. add a bunch of whitespace to the front of it
  def without_pipes do
    String.pad_leading(String.upcase(String.reverse("hello world")), 30)
  end

  def with_pipes do
    "hello world"
    |> String.reverse
    |> String.upcase
    |> String.pad_leading(30)
  end
end
