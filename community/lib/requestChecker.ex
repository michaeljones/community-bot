defmodule Community.RequestChecker do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def init([]) do
    schedule_work()
    IO.puts Application.get_env(:community, :github_api_key)
    {:ok, Tentacat.Client.new(%{access_token: Application.get_env(:community, :github_api_key)})}
  end

  def handle_info(:check_for_requests, client) do
    schedule_work()
    do_work(client)
    {:noreply, client}
  end

  defp do_work(client) do
    issues = Tentacat.Issues.filter "community-bot", "ping", %{state: "open"}, client

    commands =
      issues
      |> Enum.flat_map(fn %{"body" => body} -> String.split(body, "\n") end)
      |> Enum.filter(fn line -> String.starts_with?(line, "cb>") end)
      |> Enum.map(fn line -> line |> String.replace_prefix("cb>", "") |> String.trim() end)
      |> Enum.map(fn command ->
        [action | args ] = String.split(command)
        case action do
          "clone" ->
            [ author, repo ] = String.split(Enum.at(args, 0), "/")
            IO.inspect [ "cloning", author, repo ]
            result = Tentacat.Repositories.Forks.create author, repo, %{organization: "communityhub"}, client
            IO.inspect result

          act ->
            IO.puts "Unknown action #{act}"
        end

      end)

    client
  end

  defp schedule_work do
    Process.send_after(self(), :check_for_requests, 5_000)
  end
end
