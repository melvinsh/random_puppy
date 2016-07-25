defmodule RandomPuppy.Mixfile do
  use Mix.Project

  def project do
    [app: :random_puppy,
     version: "0.1.0",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpotion]]
  end

  defp deps do
    [
      {:httpotion, "~> 3.0.0"},
      {:json, "~> 0.3.0"},
      {:mock, "~> 0.1.1", only: :test}
    ]
  end
end
