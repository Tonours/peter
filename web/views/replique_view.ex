defmodule Peter.RepliqueView do
  use Peter.Web, :view

  def render("index.json", %{repliques: repliques}) do
    %{
      repliques: Enum.map(repliques, &replique_json/1)
    }
  end

  def render("show.json", %{replique: replique}) do
      %{ replique: replique_json(replique) }
  end


  def replique_json(replique) do
    %{
      id: replique.id,
      title: replique.title,
      description: replique.description,
      image: replique.image,
      song: replique.song,
      video: replique.video,
      inserted_at: replique.inserted_at,
      updated_at: replique.updated_at
    }
  end
end
