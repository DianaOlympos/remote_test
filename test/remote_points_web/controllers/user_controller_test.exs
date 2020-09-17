defmodule RemotePointsWeb.UserControllerTest do
  use RemotePointsWeb.ConnCase

  alias RemotePoints.Points
  alias RemotePoints.Points.User

  @create_attrs %{
    points: 100
  }

  def fixture(:user) do
    {:ok, user} = Points.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show" do
    test "lists users", %{conn: conn} do
      user = fixture(:user)
      conn = get(conn, Routes.user_path(conn, :show))
      assert json_response(conn, 200)["users"] == [%{"id" => user.id, "points" => user.points}]
    end
  end
end
