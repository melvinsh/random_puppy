defmodule RandomPuppy.Mixfile do
  use Mix.Project

  def project do
    [
      app: :random_puppy,
      version: "0.1.0",
      description: "Get a URL to a random puppy image.",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps()
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Melvin Lammerts"],
      links: %{"GitHub" => "https://github.com/melvinsh/random_puppy"}
    ]
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
