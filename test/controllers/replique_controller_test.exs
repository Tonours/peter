defmodule Peter.RepliqueControllerTest do
  use Peter.ConnCase

  alias Peter.Replique
  @valid_attrs %{description: "some content", image: "some content", published: true, song: "some content", title: "some content", video: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, replique_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing repliques"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, replique_path(conn, :new)
    assert html_response(conn, 200) =~ "New replique"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, replique_path(conn, :create), replique: @valid_attrs
    assert redirected_to(conn) == replique_path(conn, :index)
    assert Repo.get_by(Replique, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, replique_path(conn, :create), replique: @invalid_attrs
    assert html_response(conn, 200) =~ "New replique"
  end

  test "shows chosen resource", %{conn: conn} do
    replique = Repo.insert! %Replique{}
    conn = get conn, replique_path(conn, :show, replique)
    assert html_response(conn, 200) =~ "Show replique"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, replique_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    replique = Repo.insert! %Replique{}
    conn = get conn, replique_path(conn, :edit, replique)
    assert html_response(conn, 200) =~ "Edit replique"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    replique = Repo.insert! %Replique{}
    conn = put conn, replique_path(conn, :update, replique), replique: @valid_attrs
    assert redirected_to(conn) == replique_path(conn, :show, replique)
    assert Repo.get_by(Replique, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    replique = Repo.insert! %Replique{}
    conn = put conn, replique_path(conn, :update, replique), replique: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit replique"
  end

  test "deletes chosen resource", %{conn: conn} do
    replique = Repo.insert! %Replique{}
    conn = delete conn, replique_path(conn, :delete, replique)
    assert redirected_to(conn) == replique_path(conn, :index)
    refute Repo.get(Replique, replique.id)
  end
end
