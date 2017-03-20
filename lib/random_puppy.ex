defmodule RandomPuppy do
  use HTTPotion.Base

  def get do
    HTTPotion.get("https://imgur.com/r/puppy/hot.json")
      |> process_response
      |> get_random_image
      |> to_imgur_url
  end

  defp process_response(response) do
    response
      |> Map.get(:body)
      |> JSON.decode!
      |> Map.get("data")
  end

  defp get_random_image(puppies) do
    puppies
      |> Enum.random
  end

  defp to_imgur_url(image) do
    hash = Map.get(image, "hash")
    "http://i.imgur.com/#{hash}.jpg"
  end
end
