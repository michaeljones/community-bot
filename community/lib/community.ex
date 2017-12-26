defmodule Community do
  use Application

  @moduledoc """
  Documentation for Community.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Community.hello
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    Community.Supervisor.start_link(name: Community.Supervisor)
  end
end
