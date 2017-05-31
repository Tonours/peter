defmodule Peter.RepliqueView do
  use Peter.Web, :view

  def render("index.json", %{repliques: repliques}) do
  repliques
  |> Enum.map(fn replique -> Map.take([:title, :description, :image, :song, :video, :published]) end)
end
end
