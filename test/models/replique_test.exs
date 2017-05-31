defmodule Peter.RepliqueTest do
  use Peter.ModelCase

  alias Peter.Replique

  @valid_attrs %{description: "some content", image: "some content", published: true, song: "some content", title: "some content", video: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Replique.changeset(%Replique{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Replique.changeset(%Replique{}, @invalid_attrs)
    refute changeset.valid?
  end
end
