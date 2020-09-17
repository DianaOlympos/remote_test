defmodule RemotePointsWeb.TimeView do
  use RemotePointsWeb, :view

  def render("iso8601.json", %{time: time}) do
    DateTime.to_iso8601(time)
  end
end
