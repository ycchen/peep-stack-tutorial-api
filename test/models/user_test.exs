defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "foo@bar.com", password: "abcde12345", password_confirmation: "abcde12345"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    # IO.inspect(changeset)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    # IO.inspect(changeset)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com", password: "12345678", password_confirmation: "12341234"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com", password: "12345678"})
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com", password: "1234", password_confirmation: "1234"})
    refute changeset.valid?
  end
end
