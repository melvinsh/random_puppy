ExUnit.start()

defmodule RandomPuppyTestHelpers do
  def mock_http_response do
    {:ok, body} = File.read("test/fixtures/response.json")
    %{status_code: 200, body: body}
  end
end
