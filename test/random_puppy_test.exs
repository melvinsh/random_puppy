defmodule RandomPuppyTest do
  use ExUnit.Case, async: false
  doctest RandomPuppy

  import Mock

  test "it gets the hottest puppies from imgur" do
    response = RandomPuppyTestHelpers.mock_http_response
    with_mock HTTPotion, [get: fn(_url) -> response end] do
      RandomPuppy.get
      assert called HTTPotion.get("https://imgur.com/r/puppy/hot.json")
    end
  end
  
  test "it returns a random puppy URL" do
    response = RandomPuppyTestHelpers.mock_http_response
    with_mock HTTPotion, [get: fn(_url) -> response end] do
      puppy_url = RandomPuppy.get
      assert Regex.match?(~r{http://i.imgur.com/(.*).jpg}, puppy_url)
    end
   end
end
