defmodule Community.Mixfile do
  use Mix.Project

  def project do
    [
      app: :community,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:tentacat],
      extra_applications: [:logger],
      mod: {Community, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tentacat, "~> 0.8"}
    ]
  end
end
