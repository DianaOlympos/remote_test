defmodule RemotePointsWeb.UserControllerTest do
  use RemotePointsWeb.ConnCase

  alias RemotePoints.Points
  alias RemotePoints.Points.User

  @create_attrs %{
    points: 42
  }
  @update_attrs %{
    points: 43
  }
  @invalid_attrs %{points: nil}

  def fixture(:user) do
    {:ok, user} = Points.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all users", %{conn: conn} do
  #     conn = get(conn, Routes.user_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
