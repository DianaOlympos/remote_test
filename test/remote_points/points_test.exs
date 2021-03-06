defmodule RemotePoints.PointsTest do
  use RemotePoints.DataCase

  alias RemotePoints.Points

  describe "users" do
    alias RemotePoints.Points.User

    @valid_attrs %{points: 42}
    @update_attrs %{points: 43}
    @invalid_attrs %{points: 101}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Points.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Points.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Points.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Points.create_user(@valid_attrs)
      assert user.points == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Points.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Points.update_user(user, @update_attrs)
      assert user.points == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Points.update_user(user, @invalid_attrs)
      assert user == Points.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Points.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Points.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Points.change_user(user)
    end
  end
end
