defmodule MagellanMicroservice.AppStatus do
  require Logger

  def start_link() do
    Logger.info "--> starting the magellan-app-status"
    conf = Application.get_all_env :microservice
    Agent.start_link(fn ->
    %{
    conf: "conf",
    status: :ok,
    statusDetail: %{}
    } end, name: __MODULE__)
  end

  def updateState(state) do
    Agent.update(__MODULE__, fn(n) -> Map.update!(n, :statusDetail, &(Map.merge(&1, state))) end)
  end

  def getStatus() do
    Agent.get(__MODULE__, fn(n) -> n end)
  end

  def getJsonState() do
    Poison.Encoder.encode(getStatus, [])
  end

  def getHealth() do
    "OK"
  end
end
